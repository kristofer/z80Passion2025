#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

#include "ktbox.h"


// still working to get something useful here.
// void flushinp(void)
// {
//     // discard any escape sequence without writing in buffer
//     vdp_cursor_tab(10,10);
//     printf("(**flushinp called**)");
// }


// This is a buffered implementation of a "terminal"
// I will go thru and redo with all Agon VDU commands
// to cut down on screen flashing.

// Initialize the screen buffer with specified dimensions
KTBox* ktbox_init(int cols, int rows) {
    if (cols <= 0) cols = KTBOX_DEFAULT_COLS;
    if (rows <= 0) rows = KTBOX_DEFAULT_ROWS;

    KTBox *box = (KTBox*)malloc(sizeof(KTBox));
    if (!box) return NULL;

    // Initialize the struct
    box->cols = cols;
    box->rows = rows;
    box->cursor_x = 0;
    box->cursor_y = 0;
    box->initialized = false;
    box->input_initialized = false;
    box->sv = NULL;

    // Allocate the buffer
    box->buffer = (char**)malloc(rows * sizeof(char*));
    if (!box->buffer) {
        free(box);
        return NULL;
    }

    // Allocate each row
    for (int i = 0; i < rows; i++) {
        box->buffer[i] = (char*)malloc((cols + 1) * sizeof(char));
        if (!box->buffer[i]) {
            // Clean up if allocation fails
            for (int j = 0; j < i; j++) {
                free(box->buffer[j]);
            }
            free(box->buffer);
            free(box);
            return NULL;
        }
        // Initialize row with spaces
        memset(box->buffer[i], ' ', cols);
        box->buffer[i][cols] = '\0';  // Null-terminate for easier string operations
    }

    // Allocate attributes (could be NULL for now if not needed)
    box->attributes = NULL;

    box->initialized = true;
    return box;
}

// Free all resources used by the screen buffer
void ktbox_free(KTBox *box) {
    if (!box || !box->initialized) return;

    ktdev_home(box); // Move cursor to home position
    ktdev_blank(box); // Move cursor to home position

    // Cleanup input if initialized
    if (box->input_initialized) {
        ktbox_cleanup_input(box);
    }

    // Free each row of the buffer
    for (int i = 0; i < box->rows; i++) {
        free(box->buffer[i]);
    }
    free(box->buffer);

    // Free attributes if they exist
    if (box->attributes) {
        for (int i = 0; i < box->rows; i++) {
            free(box->attributes[i]);
        }
        free(box->attributes);
    }

    // Free the box struct itself
    free(box);
}

char  *ktdev_init(int *maxc, int *maxr) {
    // this not seems to work
    // volatile SYSVAR *_sv;
    // vdp_get_scr_dims(true);
    // *maxr = _sv->scrRows;
    // *maxc = _sv->scrCols;

    // return sprintf("max rows, cols %d, %d\n", *maxr, *maxc);
}

void ktdev_deinit(KTBox *box) {}

// Resize the buffer to new dimensions
// bool ktbox_resize(KTBox *box, int cols, int rows) {
//     if (!box || !box->initialized) return false;
//     if (cols <= 0 || rows <= 0) return false;

//     // Create a new buffer with the new dimensions
//     char **new_buffer = (char**)malloc(rows * sizeof(char*));
//     if (!new_buffer) return false;

//     for (int i = 0; i < rows; i++) {
//         new_buffer[i] = (char*)malloc((cols + 1) * sizeof(char));
//         if (!new_buffer[i]) {
//             // Clean up if allocation fails
//             for (int j = 0; j < i; j++) {
//                 free(new_buffer[j]);
//             }
//             free(new_buffer);
//             return false;
//         }

//         // Fill with spaces by default
//         memset(new_buffer[i], ' ', cols);
//         new_buffer[i][cols] = '\0';

//         // Copy data from old buffer if it exists
//         if (i < box->rows) {
//             int copy_cols = (cols < box->cols) ? cols : box->cols;
//             memcpy(new_buffer[i], box->buffer[i], copy_cols);
//         }
//     }

//     // Free old buffer
//     for (int i = 0; i < box->rows; i++) {
//         free(box->buffer[i]);
//     }
//     free(box->buffer);

//     // Update with new buffer
//     box->buffer = new_buffer;
//     box->cols = cols;
//     box->rows = rows;

//     // Adjust cursor if it's now outside boundaries
//     if (box->cursor_x >= cols) box->cursor_x = cols - 1;
//     if (box->cursor_y >= rows) box->cursor_y = rows - 1;

//     return true;
// }

// Clear the screen buffer
void ktbox_clear(KTBox *box) {
    if (!box || !box->initialized) return;

    for (int i = 0; i < box->rows; i++) {
        memset(box->buffer[i], ' ', box->cols);
    }
}

void ktbox_clrtoeol(KTBox *box) {
    if (!box || !box->initialized) return;

    memset(box->buffer[box->cursor_y] + box->cursor_x, ' ', box->cols - box->cursor_x);
}

// Put a character at the specified position
void ktbox_putchar(KTBox *box, int x, int y, char c) {
    if (!box || !box->initialized) return;
    if (x < 0 || x >= box->cols || y < 0 || y >= box->rows) return;

    box->buffer[y][x] = c;
}

// Get the character at the specified position
char ktbox_getchar(KTBox *box, int x, int y) {
    if (!box || !box->initialized) return '\0';
    if (x < 0 || x >= box->cols || y < 0 || y >= box->rows) return '\0';

    return box->buffer[y][x];
}

// Put a string at the specified position
void ktbox_puts(KTBox *box, int x, int y, const char *str) {
    if (!box || !box->initialized || !str) return;
    if (y < 0 || y >= box->rows) return;

    size_t len = strlen(str);
    for (size_t i = 0; i < len; i++) {
        if (x + i >= box->cols) break;
        box->buffer[y][x + i] = str[i];
    }
}

// Add a string to the box
void ktbox_addstr(KTBox *box, const char *str) {
    if (!box || !box->initialized || !str) return;

    size_t len = strlen(str);
    for (size_t i = 0; i < len; i++) {
        if (box->cursor_x + i >= box->cols) break;
        box->buffer[box->cursor_y][box->cursor_x + i] = str[i];
    }
}

void ktbox_addch(KTBox *box, char c) {
    if (!box || !box->initialized) return;

    if (box->cursor_x >= box->cols) return;
    box->buffer[box->cursor_y][box->cursor_x++] = c;
}

// Fill a region with a specific character
void ktbox_fill_region(KTBox *box, int x1, int y1, int x2, int y2, char c) {
    if (!box || !box->initialized) return;

    // Ensure coordinates are in bounds
    if (x1 < 0) x1 = 0;
    if (y1 < 0) y1 = 0;
    if (x2 >= box->cols) x2 = box->cols - 1;
    if (y2 >= box->rows) y2 = box->rows - 1;

    // Check if region is valid
    if (x1 > x2 || y1 > y2) return;

    for (int y = y1; y <= y2; y++) {
        for (int x = x1; x <= x2; x++) {
            box->buffer[y][x] = c;
        }
    }
}

// Move cursor to the specified position
void ktbox_move_cursor(KTBox *box, int x, int y) {
    if (!box || !box->initialized) return;

    // Ensure coordinates are in bounds
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    if (x >= box->cols) x = box->cols - 1;
    if (y >= box->rows) y = box->rows - 1;

    box->cursor_x = x;
    box->cursor_y = y;
}

// Get the current cursor position
void ktbox_get_cursor(KTBox *box, int *x, int *y) {
    if (!box || !box->initialized) return;

    if (x) *x = box->cursor_x;
    if (y) *y = box->cursor_y;
}

/*
 * RENDER
 *
 * Render the buffer to the terminal
 * (currently a LOT of flashing on each keystroke)
 */
void ktbox_render(KTBox *box) {
    if (!box || !box->initialized) return;

    ktbox_cursor_hide(true);
    ktdev_blank(box); // clear screen buffer
    // Print the buffer
    for (int r = 0; r < box->rows; r++) {
        for (int c = 0; c < box->cols; c++) {
            printf("%c", box->buffer[r][c]);
        }
    }

    ktbox_cursor_hide(false);
    fflush(stdout);
}

void ktdev_home(KTBox *box) {
    vdp_cursor_tab( 0, 0);
}

void ktdev_blank(KTBox *box) {
    vdp_clear_screen();
}

void ktbox_cursor_hide(bool hide){
	if (hide == true) {
		vdp_cursor_enable( false );
		return ;
	} else {
	    vdp_cursor_enable( true );
		return ;
	}
}


// void ktdev_position_cursor(KTBox *box, int x, int y){
//     vdp_cursor_tab(x, y);
// }

// set the screen cursor to the ktbox cursor
void ktdev_set_cursor(KTBox *box) {
    ktbox_move_cursor(box, box->cursor_x, box->cursor_y);
    vdp_cursor_tab(box->cursor_x, box->cursor_y);
}

void ktdev_delay(KTBox *box, int seconds) {
    //sleep(seconds);
    for (int i = 0; i < seconds; i++) {
        for (int j = 0; j < 50; j++) waitvblank(); // 20ms(?)
    }
} // this appears to work! :-)

// Global variables for key handling
static KEY_EVENT prev_key_event = { 0 };
static volatile int _current_key = -1;
// this all for debugging.
#define DEBUG 1

#ifdef DEBUG
char history[80];
char *history_ptr = 0;
int kevs = 0;
int maxkevs = 0;
void recordkey(int key) {
    kevs++;
    if (kevs > 78) {
        puts("History buffer overflow");
        history_ptr = history;
        kevs = 0;
        maxkevs++;
        if (maxkevs > 2) {
            puts("Max history buffer overflow");
            puts(history);
            exit(1);
        }
    }
    *history_ptr++ = key;
    *history_ptr = '\0';
}
#endif

void ktbdev_debug(int x, int y, char *str) {
    //vdp_cursor_tab(x,y);
    //printf("%s",str);
}

// end of debugging junk.

// Key event handler for Agon VDP
// this is a callback function, invoked whenever a key event occurs
// MANY 0 key_events
static void ktbox_key_event_handler(KEY_EVENT key_event) {
    if (key_event.key_data == prev_key_event.key_data) {
        _current_key = -1;
        return;
    } else {
        prev_key_event = key_event;
        if (key_event.down != 0) {
            _current_key = key_event.ascii;
#ifdef DEBUG
            recordkey(_current_key);
            if (_current_key == KTBOX_KEY_CRTL_Z) {
                printf("forced exiting\n");
                exit(2);
#endif
            }
        } else {
            _current_key = -1;
        }
        return;
    }
}

// Initialize the input handling system
bool ktbox_init_input(KTBox *box) {
    if (!box || box->input_initialized) return false;

    // Initialize the VDP system
    box->sv = vdp_vdu_init();

    // Initialize keyboard handling
    if (vdp_key_init() == -1) {
        return false;
    }

    // Set our key event handler
    printf("setting input handler\n");
    vdp_set_key_event_handler(ktbox_key_event_handler);

    box->input_initialized = true;
    history_ptr = &history[0];
    return true;
}

// Clean up the input handling system
void ktbox_cleanup_input(KTBox *box) {
    if (!box || !box->input_initialized) return;
    // If there's a specific cleanup function in the Agon API, it would go here
    box->input_initialized = false;
}

// Read a key (blocking)
int ktbox_read_key(void) {
    int key = -1;
    while (key == -1) {
        key = _current_key;
        waitvblank();
    }

    // Reset _current_key to prevent repeating
    _current_key = -1;
    vdp_update_key_state();

    // Map the key to our constants if needed
    return ktbox_map_key(key);
}

// Check if a key is available (non-blocking)
bool ktbox_key_available(void) {
    vdp_update_key_state();
    return _current_key != -1;
}

// Map Agon key codes to our internal constants if needed
// this could map Agon to vt52/vt100/ANSI keys
int ktbox_map_key(int key_code) {
    // This mapping depends on the specific key codes provided by the Agon keyboard system
    // You'll need to adjust this based on the actual key codes

    // For now, just return the key code as-is
    // Extend this function with specific mappings as needed

    // Example mappings (adjust based on actual Agon key codes):
    /*
    switch (key_code) {
        case VDP_KEY_UP:    return KTBOX_KEY_UP;
        case VDP_KEY_DOWN:  return KTBOX_KEY_DOWN;
        case VDP_KEY_LEFT:  return KTBOX_KEY_LEFT;
        case VDP_KEY_RIGHT: return KTBOX_KEY_RIGHT;
        // Add more mappings as needed
        default: return key_code;
    }
    */

    return key_code;
}
