//# KTBox: A Simple Terminal Screen Buffer Library

// Let's build a simple screen buffer library called KTBox for terminal applications like vi and emacs. This will provide basic functionality for managing a character-based terminal display.

//## ktbox.h
#ifndef KTBOX_H
#define KTBOX_H

#include <stddef.h>
#include <stdbool.h>

// Default terminal dimensions
#define KTBOX_DEFAULT_COLS 80
#define KTBOX_DEFAULT_ROWS 24

typedef struct {
    char **buffer;           // The 2D character buffer
    char **attributes;       // Optional character attributes (colors, styles)
    int cols;                // Number of columns
    int rows;                // Number of rows
    bool initialized;        // Flag to track initialization state
    int cursor_x;            // Current cursor X position
    int cursor_y;            // Current cursor Y position
} KTBox;

// Core functions
KTBox* ktbox_init(int cols, int rows);
void ktbox_free(KTBox *box);
bool ktbox_resize(KTBox *box, int cols, int rows);
void ktbox_clear(KTBox *box);

// Screen manipulation
void ktbox_putchar(KTBox *box, int x, int y, char c);
char ktbox_getchar(KTBox *box, int x, int y);
void ktbox_puts(KTBox *box, int x, int y, const char *str);
void ktbox_fill_region(KTBox *box, int x1, int y1, int x2, int y2, char c);

// Cursor manipulation
void ktbox_move_cursor(KTBox *box, int x, int y);
void ktbox_get_cursor(KTBox *box, int *x, int *y);

// Display rendering
void ktbox_render(KTBox *box);  // Output buffer to actual terminal

// low-level functions
void ktdev_init(KTBox *box);
void ktdev_deinit(KTBox *box);
void ktdev_delay(KTBox *box, int seconds);
void ktdev_putchar(KTBox *box, int x, int y, char c);
void ktdev_get_cursor(KTBox *box, int *x, int *y);
void ktdev_move_cursor(KTBox *box, int x, int y);
void ktbox_cursor_hide(bool hide);
void ktdev_clear_screen(KTBox *box);
void ktdev_home(KTBox *box);
void ktdev_blank(KTBox *box);
void ktdev_fill_region(KTBox *box, int x1, int y1, int x2, int y2, char c);
void ktdev_render_buffer(KTBox *box);

#endif /* KTBOX_H */
