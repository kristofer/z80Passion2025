#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ktbox.h"

#define MAXROWS 50
#define MAXCOLS 80
#define STATUS_LINE (MAXROWS-2) // Position for status line

void update_status(KTBox *box, const char *message) {
    // Clear the status line
    for (int i = 0; i < box->cols; i++) {
        ktbox_putchar(box, i, STATUS_LINE, ' ');
    }

    // Display the message
    ktbox_puts(box, 1, STATUS_LINE, message);
}

void process_key(KTBox *box, int key) {
    char status[64];
    if (key == '\x06') {
        ktbox_move_cursor(box, box->cursor_x+1, box->cursor_y);
        sprintf(status, "fwd %02x to (%d,%d)", key, box->cursor_x, box->cursor_y);
        update_status(box, status);
    }
    if (key == '\x02') {
        ktbox_move_cursor(box, box->cursor_x-1, box->cursor_y);
        sprintf(status, "back %02x to (%d,%d)", key, box->cursor_x, box->cursor_y);
        update_status(box, status);
    }
    if (key == '\x0E') {
        ktbox_move_cursor(box, box->cursor_x, box->cursor_y+1);
        sprintf(status, "down %02x to (%d,%d)", key, box->cursor_x, box->cursor_y);
        update_status(box, status);
    }
    if (key == '\x10') {
        ktbox_move_cursor(box, box->cursor_x, box->cursor_y-1);
        sprintf(status, "up %02x to (%d,%d)", key, box->cursor_x, box->cursor_y);
        update_status(box, status);
    }
}

int main() {

    KTBox *box = ktbox_init(MAXCOLS, MAXROWS);
    if (!box) {
        fprintf(stderr, "Failed to initialize KTBox\n");
        return 1;
    }

    // Initialize input handling
    if (!ktbox_init_input(box)) {
        fprintf(stderr, "Failed to initialize input system\n");
        ktbox_free(box);
        return 1;
    }

    // Draw a border
    ktbox_fill_region(box, 0, 0, box->cols-1, 0, '-');          // Top
    ktbox_fill_region(box, 0, box->rows-1, box->cols-1, box->rows-1, '-'); // Bottom
    ktbox_fill_region(box, 0, 0, 0, box->rows-1, '|');          // Left
    ktbox_fill_region(box, box->cols-1, 0, box->cols-1, box->rows-1, '|'); // Right

    // Put corner characters
    ktbox_putchar(box, 0, 0, '+');
    ktbox_putchar(box, box->cols-1, 0, '+');
    ktbox_putchar(box, 0, box->rows-1, '+');
    ktbox_putchar(box, box->cols-1, box->rows-1, '+');

    // Add some text
    ktbox_puts(box, 0, 1, "Welcome to KTBox on Agon VDP!");
    ktbox_puts(box, 0, 2, "Line 2");
    ktbox_puts(box, 2, 3, "Line 3");
    ktbox_puts(box, 2, 4, "A simple screen buffer library with Agon input handling.");
    ktbox_puts(box, 2, 6, "Press keys to type, ESC or Backspace to exit.");
    ktbox_puts(box, 8, 9, ".x8,y9");
    ktbox_puts(box, 9, 8, ".x9,y8");


    // Display initial status
    update_status(box, "Ready. Type to add characters, ESC or Backspace to exit.");

    // Initial cursor position
    ktdev_home(box);
    // Initial render
    ktbox_render(box);
    ktbox_move_cursor(box, 10, 10);

    // Main loop
    bool running = true;
    while (running) {
        // Check for key input
        if (ktbox_key_available()) {
            int key = ktbox_read_key();
            char status[80];

            if (key == KTBOX_KEY_ESC || key == KTBOX_KEY_BACKSPACE) {
                running = false;
            } else if (key >= 32 && key <= 126) {  // Printable ASCII
                ktbox_putchar(box, box->cursor_x, box->cursor_y, (char)key);
                ktbox_move_cursor(box, box->cursor_x+1, box->cursor_y);
                ktdev_set_cursor(box);

                sprintf(status, "Character typed: '%c' (ASCII %d) at (%d,%d)",
                    (char)key, key, box->cursor_x, box->cursor_y);
                update_status(box, status);
            } else {
                if (key != 0) {
                    sprintf(status, "Key pressed: code %02x", key);
                    update_status(box, status);
                    process_key(box, key);
                }
            }

            // Render the updated screen
            ktbox_render(box);
            ktdev_set_cursor(box);
        }
    }

    // Cleanup
    ktbox_cleanup_input(box);
    ktbox_free(box);

    printf("\nok\n\n");
    printf("\n>>(%d) %s %d\n", kevs, history, strlen(history));

    return 0;
}
