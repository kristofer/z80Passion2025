//# KTBox: A Simple Terminal Screen Buffer Library

// A simple screen buffer library called
// KTBox for terminal applications like vi and emacs.
// This will provide basic functionality for managing a
// character-based terminal display.

//## ktbox.h
#ifndef KTBOX_H
#define KTBOX_H

#include <stddef.h>
#include <stdbool.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

// Default terminal dimensions
#define KTBOX_DEFAULT_COLS 80
#define KTBOX_DEFAULT_ROWS 59

// Key codes for special keys
#define KTBOX_KEY_ESC       0x1B
#define KTBOX_KEY_ENTER     0x0A
#define KTBOX_KEY_BACKSPACE 0x7F
#define KTBOX_KEY_TAB       0x09
#define KTBOX_KEY_CRTL_C    0x03
#define KTBOX_KEY_CRTL_Q    0x11

// Agon Keys are different
//
// Special key identifiers (for function keys, arrow keys, etc.)
#define KTBOX_KEY_UP        1001
#define KTBOX_KEY_DOWN      1002
#define KTBOX_KEY_LEFT      1003
#define KTBOX_KEY_RIGHT     1004
#define KTBOX_KEY_HOME      1005
#define KTBOX_KEY_END       1006
#define KTBOX_KEY_PGUP      1007
#define KTBOX_KEY_PGDN      1008
#define KTBOX_KEY_F1        1009
#define KTBOX_KEY_F2        1010
#define KTBOX_KEY_F3        1011
#define KTBOX_KEY_F4        1012
#define KTBOX_KEY_F5        1013
#define KTBOX_KEY_F6        1014
#define KTBOX_KEY_F7        1015
#define KTBOX_KEY_F8        1016
#define KTBOX_KEY_F9        1017
#define KTBOX_KEY_F10       1018
#define KTBOX_KEY_F11       1019
#define KTBOX_KEY_F12       1020
#define KTBOX_KEY_DEL       1021
#define KTBOX_KEY_INS       1022

typedef struct {
    char **buffer;           // The 2D character buffer
    char **attributes;       // Optional character attributes (colors, styles)
    int cols;                // Number of columns
    int rows;                // Number of rows
    bool initialized;        // Flag to track initialization state
    int cursor_x;            // Current cursor X position
    int cursor_y;            // Current cursor Y position
    bool input_initialized;  // Flag indicating if input is initialized
    volatile SYSVAR *sv;              // Agon VDP system variables
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
void ktbox_addstr(KTBox *box, const char *str);
void ktbox_addch(KTBox *box, char c);
// ** void mvaddstr(int x, int y, const char *str);
// ** void addstr(const char *str);
void ktbox_fill_region(KTBox *box, int x1, int y1, int x2, int y2, char c);
void ktbox_clrtoeol(KTBox *box);

// Cursor manipulation
void ktbox_move_cursor(KTBox *box, int x, int y);
void ktbox_get_cursor(KTBox *box, int *x, int *y);

// Display rendering
void ktbox_render(KTBox *box);  // Output buffer to actual terminal

// Input handling using Agon VDP/keyboard system
bool ktbox_init_input(KTBox *box);
void ktbox_cleanup_input(KTBox *box);
int ktbox_read_key(void);         // Read a single keystroke
bool ktbox_key_available(void);   // Check if a key is available
int ktbox_map_key(int key_code); // Map Agon key codes to our constants

// low-level functions
char *ktdev_init(int *maxc, int *maxr);
void ktdev_deinit(KTBox *box);
void ktdev_delay(KTBox *box, int seconds);
void ktdev_putchar(KTBox *box, int x, int y, char c);
void ktdev_get_cursor(KTBox *box, int *x, int *y);
void ktdev_move_cursor(KTBox *box, int x, int y);
void ktbox_cursor_hide(bool hide);
void ktdev_home(KTBox *box);
void ktdev_blank(KTBox *box);
void ktdev_fill_region(KTBox *box, int x1, int y1, int x2, int y2, char c);
void ktdev_render_buffer(KTBox *box);
//void ktdev_position_cursor(KTBox *box, int x, int y);
void ktdev_set_cursor(KTBox *box);
void ktdev_debug(int x, int y, char *str);

// debugging junk.
extern char history[];
extern int kevs;

void flushinp(void)
{
    // discard any escape sequence without writing in buffer
    //vdp_cursor_tab(10,10);
    //printf("(**flushinp called**)");
}

//

#endif /* KTBOX_H */
