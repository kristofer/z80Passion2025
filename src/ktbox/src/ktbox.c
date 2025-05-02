#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ktbox.h"
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

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

volatile SYSVAR *sv;

void ktdev_init(KTBox *box) {
    sv = vdp_vdu_init();
	if (vdp_key_init() == -1)
		return;

    vdp_mode( 1 );	//Mode 3 is 80x30
}
void ktdev_deinit(KTBox *box) {}

// Resize the buffer to new dimensions
bool ktbox_resize(KTBox *box, int cols, int rows) {
    if (!box || !box->initialized) return false;
    if (cols <= 0 || rows <= 0) return false;

    // Create a new buffer with the new dimensions
    char **new_buffer = (char**)malloc(rows * sizeof(char*));
    if (!new_buffer) return false;

    for (int i = 0; i < rows; i++) {
        new_buffer[i] = (char*)malloc((cols + 1) * sizeof(char));
        if (!new_buffer[i]) {
            // Clean up if allocation fails
            for (int j = 0; j < i; j++) {
                free(new_buffer[j]);
            }
            free(new_buffer);
            return false;
        }

        // Fill with spaces by default
        memset(new_buffer[i], ' ', cols);
        new_buffer[i][cols] = '\0';

        // Copy data from old buffer if it exists
        if (i < box->rows) {
            int copy_cols = (cols < box->cols) ? cols : box->cols;
            memcpy(new_buffer[i], box->buffer[i], copy_cols);
        }
    }

    // Free old buffer
    for (int i = 0; i < box->rows; i++) {
        free(box->buffer[i]);
    }
    free(box->buffer);

    // Update with new buffer
    box->buffer = new_buffer;
    box->cols = cols;
    box->rows = rows;

    // Adjust cursor if it's now outside boundaries
    if (box->cursor_x >= cols) box->cursor_x = cols - 1;
    if (box->cursor_y >= rows) box->cursor_y = rows - 1;

    return true;
}

// Clear the screen buffer
void ktbox_clear(KTBox *box) {
    if (!box || !box->initialized) return;

    for (int i = 0; i < box->rows; i++) {
        memset(box->buffer[i], ' ', box->cols);
    }
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

// Render the buffer to the terminal
void ktbox_render(KTBox *box) {
    if (!box || !box->initialized) return;

    ktbox_cursor_hide(true);
    // Position the cursor at the top-left
    ktdev_home(box); // Move cursor to home position
    ktdev_blank(box); // Move cursor to home position

    // Print the buffer
    for (int i = 0; i < box->rows; i++) {
        printf("%.*s\r\n", box->cols, box->buffer[i]);
    }

    // Position the cursor
    ktbox_move_cursor(box, box->cursor_y + 1, box->cursor_x + 1);
    fflush(stdout);
    ktbox_cursor_hide(true);
}

void ktdev_home(KTBox *box) {
//    ktbox_move_cursor(box, 1, 1);
    vdp_cursor_tab( 1, 1);
}

void ktdev_blank(KTBox *box) {
    //ktbox_fill_region(box, 0, 0, box->cols, box->rows, ' ');
    vdp_clear_screen();
}

void ktdev_delay(KTBox *box, int seconds) {
    //sleep(seconds);
    char ch = NULL;
    ch = ktbox_getchar(box, 10, 10);
    for (int i = 0; i < seconds * 10; i++) {
        ktbox_putchar(box, i % 10, 10, 'X');
        ktbox_render(box);

        ktbox_putchar(box, i % 10, 10, ch);
        ktbox_render(box);
    }
    ktbox_putchar(box, 10, 10, ch);
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
