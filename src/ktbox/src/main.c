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

void display_msg(KTBox *box, int key) {
    char status[64];
    sprintf(status, "(0x%02x) moved to (%d,%d)", key, box->cursor_x, box->cursor_y);
    update_status(box, status);
}
void process_key(KTBox *box, int key) {
    if (key == '\x06' || key == '\x0C') { // fwd, right
        ktbox_move_cursor(box, box->cursor_x+1, box->cursor_y);
    }
    if (key == '\x02' || key == '\x08' || key == KTBOX_KEY_BACKSPACE) { // back, left
        ktbox_move_cursor(box, box->cursor_x-1, box->cursor_y);
    }
    if (key == '\x0E' || key == '\x0a') { // down
        ktbox_move_cursor(box, box->cursor_x, box->cursor_y+1);
    }
    if (key == '\x10' || key == '\x0b') { // up
        ktbox_move_cursor(box, box->cursor_x, box->cursor_y-1);
    }

    if (key == '\x15') { // HACK on emul Mac fwd, right
        ktbox_move_cursor(box, box->cursor_x+1, box->cursor_y);
    } // I wonder if this is a bug in the emulator

    display_msg(box, key);
}

static RingBuffer rbuf;

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

    init_ring_buffer(&rbuf);
    appendchar(&rbuf, 'X');
    appendchar(&rbuf, '1');
    appendchar(&rbuf, '2');
    appendchar(&rbuf, '3');

    while (charReady(&rbuf)) {
        char c0 = headchar(&rbuf);
        printf("buffer %c\n", c0);
    }

    ktdev_delay(box, 2);
    char c0 = 'a';
    appendchar(&rbuf, c0);

    vdp_update_key_state();

    while (c0 != 'q') {
        printf("not q %c\n", c0);
        printf("many? %d\n", rbuf.count);
        ktdev_delay(box, 1);
        while (rbuf.count > 0) {
//            printf("many? %cd\n", bufc.count);
            c0 = headchar(&rbuf);
            printf("ktbox key %02x %c\n", c0, c0);
        }
        waitvblank();
        vdp_update_key_state();
    }
    ktdev_delay(box, 2);

    exit(0);
    // // Draw a border
    // ktbox_fill_region(box, 0, 0, box->cols-1, 0, '-');          // Top
    ktbox_fill_region(box, 0, box->rows-1, box->cols-1, box->rows-1, '-'); // Bottom
    // ktbox_fill_region(box, 0, 0, 0, box->rows-1, '|');          // Left
    // ktbox_fill_region(box, box->cols-1, 0, box->cols-1, box->rows-1, '|'); // Right

    // // Put corner characters
    // ktbox_putchar(box, 0, 0, '+');
    // ktbox_putchar(box, box->cols-1, 0, '+');
    // ktbox_putchar(box, 0, box->rows-1, '+');
    // ktbox_putchar(box, box->cols-1, box->rows-1, '+');

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

    // Initial render
    ktbox_render(box);
    // Initial cursor position
    ktdev_home(box); // set both cursors to 0,0
    ktbox_move_cursor(box, 0, 0);

    // ktdev_delay(box, 5);
    // update_status(box, "waiting 5 seconds.");

    // Main loop
    bool running = true;
    while (running) {
        // Check for key input
        //if (ktbox_key_available()) {
        if (charReady(&bufc) == true) {
            char key = ktbox_read_key();
            char status[80];

            if (key == KTBOX_KEY_ESC || key == KTBOX_KEY_CRTL_C) {
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
                    sprintf(status, "Key pressed: code 0x%02x", key);
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
    //printf("\n>>(%d) %s %d\n", kevs, history, strlen(history));

    return 0;
}
