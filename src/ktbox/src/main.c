#include <stdio.h>
#include <stdlib.h>
#include "ktbox.h"

int main() {
    // Initialize terminal settings (would normally use ncurses or similar)

    // Create our screen buffer (80x24)
    KTBox *box = ktbox_init(80, 24);
    if (!box) {
        fprintf(stderr, "Failed to initialize KTBox\n");
        return 1;
    }
    ktdev_init(box);

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
    ktbox_puts(box, 2, 2, "Welcome to KTBox!");
    ktbox_puts(box, 2, 4, "A simple terminal screen buffer library.");

    // Position cursor and render
    ktbox_move_cursor(box, 2, 6);
    ktbox_render(box);

    // Wait a bit before exiting
    ktdev_delay(box, 5);

    // Clean up
    ktbox_free(box);

    // Restore terminal settings
    ktdev_deinit(box);

    return 0;
}
