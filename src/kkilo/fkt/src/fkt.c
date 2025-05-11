#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>
// from first principles KeyHandler
//
// int vdp_key_init( void );
// void vdp_key_reset_interrupt( void );

// void vdp_update_key_state();
// bool vdp_check_key_press( uint8_t key_code );
// void vdp_set_key_event_handler( KEY_EVENT_HANDLER event_handler );


/* start ring buffer */
#define BUFFER_SIZE 32
// Circular buffer structure
typedef struct {
    char data[BUFFER_SIZE];
    volatile int head;     // Index for reading (consumer)
    volatile int tail;     // Index for writing (producer)
    volatile int count;    // Number of items in the buffer
} CircularBuffer;
CircularBuffer bufc;

// Initialize the buffer
void init_buffer(CircularBuffer *buffer) {
    printf("init_buffer\n");
    buffer->head = 0;
    buffer->tail = 0;
    buffer->count = 0;
}

// Add a character to the buffer (called from interrupt handler)
void appendchar(CircularBuffer *buffer, char c) {
    printf("> appendchar\n");
    // If buffer is full, overwrite oldest data
    if (buffer->count == BUFFER_SIZE) {
        printf("> appendchar buffer overflow\n");
        buffer->head = (buffer->head + 1) % BUFFER_SIZE; // Move head forward
        buffer->count--; // Make room for new char
    }

    // Add the new character
    buffer->data[buffer->tail] = c;
    buffer->tail = (buffer->tail + 1) % BUFFER_SIZE;
    buffer->count++;
}

// Get the character at the head of the buffer (busy-waits if empty)
char headchar(CircularBuffer *buffer) {
    printf("< headchar\n");
    // Wait until there's at least one character
    while (buffer->count == 0) {
        // Busy wait
    }

    // Get the character
    char c = buffer->data[buffer->head];
    buffer->head = (buffer->head + 1) % BUFFER_SIZE;
    buffer->count--;

    return c;
}
/* end ring buffer */

void key_event_handler(KEY_EVENT key_event) {
    if (key_event.down == 1) {
        char c = key_event.ascii;
        if (c != 0) {
            //printf("event...    \n");
            if (c >= 32 && c <= 126) {
                printf("ascii: 0x%02x \n", c);
                appendchar(&bufc, c);
            } else {
                //appendchar(&bufc, c);
            }
        }
        // ignore 000
    }
    vdp_update_key_state();
}

int main() {
    int c;
    // char key_name[32];
    // FILE *log;
    init_buffer(&bufc);
    vdp_clear_screen();
    // printf("VDP Key Input Tester\n");
    // printf("====================\n\n");
    // printf("This program tests both standard input and VDP key events\n");
    // printf("Press keys to see their detailed info (Ctrl+C to exit)\n\n");

    // Initialize the VDP key handling system
    vdp_key_init();

    // Set up the event handler
    vdp_set_key_event_handler(key_event_handler);
    vdp_update_key_state();

    // Create/clear the log file
    // log = fopen("vdp_key_log.txt", "w");
    // fprintf(log, "=== VDP Key Test Started ===\n");
    // fprintf(log, "Raw | ASCII | MODS | CODE | DOWN | NAME\n");
    // fclose(log);

    while(1) {
        // Standard input test
        vdp_cursor_tab(0, 6);
        printf("Awaiting key input via stdio...    \n");

        c = headchar(&bufc);

        // vdp_cursor_tab(0, 7);
        // printf("Standard Input:                    \n");
        // printf("Hex: 0x%02x  Dec: %3d              \n", c, c);

        // Determine key name
        // if (c >= 32 && c <= 126) {
        //     sprintf(key_name, "ASCII '%c'", c);
        // } else {
        //     switch(c) {
        //         case 0x0a: strcpy(key_name, "DOWN ARROW"); break;
        //         case 0x0b: strcpy(key_name, "UP ARROW"); break;
        //         case 0x0c: strcpy(key_name, "RIGHT ARROW"); break;
        //         case 0x08: strcpy(key_name, "LEFT ARROW/BACKSPACE"); break;
        //         case 0x1b: strcpy(key_name, "ESC"); break;
        //         case 0x0d: strcpy(key_name, "ENTER/RETURN"); break;
        //         case 0x09: strcpy(key_name, "TAB"); break;
        //         case 0x7f: strcpy(key_name, "DELETE"); break;
        //         default:
        //             if (c < 32) {
        //                 sprintf(key_name, "CTRL+%c", c + 64);
        //             } else {
        //                 sprintf(key_name, "UNKNOWN");
        //             }
        //             break;
        //     }
        // }
        //printf("Key: %s                          \n\n", key_name);

        // Update key state display
        //display_key_state();

        // // Log the key info
        // log = fopen("vdp_key_log.txt", "a");
        // fprintf(log, "0x%02X | 0x%02X | - | - | - |\n",
        //         c, key_name);
        // fclose(log);

        if (c == '\x03') break;
    }

    return 0;
}
