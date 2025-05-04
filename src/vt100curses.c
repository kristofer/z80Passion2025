// Terminal-based curses library
// Converted from Agon Light 2 VDP calls to standard VT100 escape sequences
// Original copyright Shawn Sijnstra (c) 2024
// GPLv3 License

// This version uses standard VT100/ANSI terminal escape sequences instead of direct VDP calls

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdbool.h>
#include <time.h>
#include "acurses.h"
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

#ifndef __NCURSES_H
#define __NCURSES_H

#define CURSES 1
#define CURSES_H 1

/* These are defined only in curses.h, and are used for conditional compiles */
#define NCURSES_VERSION_MAJOR 0
#define NCURSES_VERSION_MINOR 1
#define NCURSES_VERSION_PATCH 0

/* This is defined in more than one ncurses header, for identification */
#undef  NCURSES_VERSION
#define NCURSES_VERSION "0.2"

#endif

// Global variables
short global_color_pairs[COLOR_PAIRS*2];  // Global to acurses only
bool blocking = true;                     // Default is read using blocking mode
char _curse_buf[512];
char _current_key = 0;

// Terminal state
// struct termios orig_termios;
// struct termios raw_termios;

// Screen dimensions and cursor position
int screen_rows = 24;
int screen_cols = 80;
int cursor_x = 0;
int cursor_y = 0;

// Save terminal state
// void save_terminal_settings() {
//     tcgetattr(STDIN_FILENO, &orig_termios);
//     raw_termios = orig_termios;
    
//     // Disable canonical mode and echo
//     raw_termios.c_lflag &= ~(ICANON | ECHO);
    
//     // Set minimum characters and timeout
//     raw_termios.c_cc[VMIN] = blocking ? 1 : 0;
//     raw_termios.c_cc[VTIME] = blocking ? 0 : 1;
// }

// // Restore terminal state
// void restore_terminal_settings() {
//     tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios);
// }

// Update terminal dimensions
void update_screen_size() {
    //struct winsize w;
    //ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    // screen_rows = w.ws_row;
    // screen_cols = w.ws_col;
    int max_x = getmaxx(0); // Get maximum X position for the line
    int max_y = getmaxy(0); // Get maximum Y position for the line
    if (max_x > 0 && max_y > 0) {
        screen_cols = max_x;
        screen_rows = max_y;
    }
}

// VT100 escape sequence helpers
void move_cursor(int x, int y) {
    printf("\033[%d;%dH", y+1, x+1);
    cursor_x = x;
    cursor_y = y;
}

void clear_screen() {
    printf("\033[2J");
    move_cursor(0, 0);
}

void clear_to_eol() {
    printf("\033[K");
}

void set_cursor_visible(bool visible) {
    if (visible)
        printf("\033[?25h");
    else
        printf("\033[?25l");
}

void set_text_color(int fg) {
    if (fg & 8) // Bright/bold
        printf("\033[1;%dm", 30 + (fg & 7));
    else
        printf("\033[0;%dm", 30 + fg);
}

void set_bg_color(int bg) {
    printf("\033[%dm", 40 + (bg & 7));
}

int addstr(const char *str) {
    printf("%s", str);
    fflush(stdout);
    return true;
}

void start_color() {
    // Initialize terminal for color support
    set_text_color(COLOR_WHITE);
    set_bg_color(COLOR_BLACK);
}

int erase(void) {
    clear_screen();
    return true;
}

int clear(void) {
    clear_screen();
    return true;
}

int clearok(int win, bool state) {
    clear_screen();
    return true;
}

int initscr() {
    // Initialize terminal
    // save_terminal_settings();
    // tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw_termios);
    vdp_terminal_mode();
    // Get screen dimensions
    update_screen_size();
    
    // Setup screen
    clear_screen();
    set_text_color(COLOR_WHITE);
    set_bg_color(COLOR_BLACK);
    
    return true;
}

int endscr(void) {
    clear_screen();
    set_text_color(COLOR_WHITE);
    set_bg_color(COLOR_BLACK);
    set_cursor_visible(true);
    vdp_terminal_mode();

//    restore_terminal_settings();
    return true;
}

int getcury(int win) {
    return cursor_y;
}

int getcurx(int win) {
    return cursor_x;
}

int getmaxy(int win) {
    update_screen_size();
    return screen_rows;
}

int getmaxx(int win) {
    update_screen_size();
    return screen_cols;
}

// Define color (not fully supported in all terminals)
int init_color(short color, short r, short g, short b) {
    // Not implemented - most terminals don't support this
    return true;
}

bool has_colors(void) {
    return true;
}

bool can_change_color(void) {
    return false;
}

int color_content(short color, short *r, short *g, short *b) {
    return false;
}

int curs_set(int visibility) {
    switch (visibility) {
        case 0:
            set_cursor_visible(false);
            return 0;
        case 1:
        case 2:
            set_cursor_visible(true);
            return visibility;
        default:
            return false;
    }
}

int printw(const char *fmt, ...) {
    va_list argp;
    int code;

    va_start(argp, fmt);
    vsprintf(_curse_buf, fmt, argp);
    code = addstr(_curse_buf);
    va_end(argp);

    return code;
}

int vw_printw(int win, const char *fmt, ...) {
    va_list argp;
    int code;

    va_start(argp, fmt);
    vsprintf(_curse_buf, fmt, argp);
    code = addstr(_curse_buf);
    va_end(argp);

    return code;
}

int mvprintw(int y, int x, const char *fmt, ...) {
    va_list argp;
    int code;
    
    move_cursor(x, y);
    
    va_start(argp, fmt);
    vsprintf(_curse_buf, fmt, argp);
    code = addstr(_curse_buf);
    va_end(argp);

    return code;
}

int init_pair(short pair, short f, short b) {
    if (pair < COLOR_PAIRS && pair >= 0) {
        global_color_pairs[pair*2] = f;
        global_color_pairs[(pair*2)+1] = b;
        return true;
    } else {
        return false;
    }
}

int pair_content(short pair, short *f, short *b) {
    if (pair < COLOR_PAIRS && pair >= 0) {
        *f = global_color_pairs[pair*2];
        *b = global_color_pairs[(pair*2)+1];
        return true;
    } else {
        return false;
    }
}

int COLOR_PAIR(int z) {
    return (((z) << ((0) + 8)));
}

int use_default_colors(void) {
    return false;
}

int refresh(void) {
    fflush(stdout);
    return true;
}

int endwin(void) {
    clear_screen();
    set_text_color(COLOR_WHITE);
    set_bg_color(COLOR_BLACK);
    set_cursor_visible(true);
    //restore_terminal_settings();
    printf("\033[0m"); // Reset all attributes
    return true;
}

int isendwin(void) {
    return false;
}

int attron(const chtype attrs) {
    short color, f, b, bold;
    color = attrs >> 8;
    bold = (color & (A_BOLD >> 8)) >> 2;
    color = (color & COLOR_PAIRS);
    
    if (color > 0) {
        pair_content(color, &f, &b);
        set_text_color(f + bold);
        set_bg_color(b);
    } else {
        set_text_color(COLOR_WHITE + bold);
    }
    
    return true;
}

int attroff(int attrs) {
    // Reset to default colors
    set_text_color(COLOR_WHITE);
    set_bg_color(COLOR_BLACK);
    return true;
}

int attr_get(attr_t *attr, int *n, int *m) {
    return false;
}

int wmove(int win, int y, int x) {
    move_cursor(x, y);
    return true;
}

int move(int y, int x) {
    move_cursor(x, y);
    return true;
}

int clrtoeol(void) {
    clear_to_eol();
    return true;
}

int addch(const chtype ch) {
    short color, f, b, bold;
    color = ch >> 8;
    bold = (color & (A_BOLD >> 8)) >> 2;
    color = (color & COLOR_PAIRS);
    
    if (color > 0) {
        pair_content(color, &f, &b);
        set_text_color(f + bold);
    } else {
        set_text_color(COLOR_WHITE + bold);
    }
    
    putchar(ch & 0xFF);
    fflush(stdout);
    return true;
}

int mvaddch(int y, int x, const chtype ch) {
    move_cursor(x, y);
    return addch(ch);
}

int noecho(void) {
    // raw_termios.c_lflag &= ~ECHO;
    // tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw_termios);
    return true;
}

int nonl(void) {
    return false;
}

int halfdelay(int tenths) {
    // Not perfectly implemented, but provides similar functionality
    // raw_termios.c_cc[VTIME] = tenths;
    // tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw_termios);
    return true;
}

int mvaddstr(int y, int x, const char *str) {
    move_cursor(x, y);
    addstr(str);
    return true;
}

int beep(void) {
    putchar(7);
    return true;
}

int keypad(int win, bool bf) {
    // Not needed for terminal mode - most terminal emulators already translate
    // special keys to escape sequences we can handle
    return true;
}

int nodelay(int win, bool bf) {
    blocking = !bf;
    return true;
}

void wtimeout(int win, int delay) {
    if (delay < 0) {
        nodelay(win, false);
    } else {
        nodelay(win, true);
        // Implement timeout with VTIME in tenths of seconds
        // raw_termios.c_cc[VTIME] = (delay > 0) ? (delay / 100) + 1 : 0;
        // tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw_termios);
    }
}

void timeout(int delay) {
    wtimeout(stdscr, delay);
}

// Keyboard input function using terminal read
char wgetch(int win) {
    char key;
    int n;
    
    // In non-blocking mode, we might need to check for input
    //n = read(STDIN_FILENO, &key, 1);
    key = getchar();
    if (n <= 0 && !blocking) {
        return -1; //ERR; // No input available
    }
    
    // Handle special keys (arrow keys, etc)
    if (key == '\033') {
        // Could be an escape sequence
        char seq[3];
        
        // Read additional bytes with a small timeout
        // raw_termios.c_cc[VTIME] = 1; // 0.1 seconds
        // tcsetattr(STDIN_FILENO, TCSANOW, &raw_termios);
        
        //if (read(STDIN_FILENO, &seq[0], 1) != 1) return '\033';
        seq[0] = getchar();
        if (seq[0] != '[') return '\033'; // Not an escape sequence
        //if (read(STDIN_FILENO, &seq[1], 1) != 1) return '\033';
        seq[1] = getchar();
        if (seq[1] < 'A' || seq[1] > 'D') return '\033'; // Not a valid escape sequence

        // Reset timeout
        // raw_termios.c_cc[VTIME] = blocking ? 0 : 1;
        // tcsetattr(STDIN_FILENO, TCSANOW, &raw_termios);
        
        // Translate some common escape sequences
        if (seq[0] == '[') {
            switch (seq[1]) {
                case 'A': return KEY_UP;
                case 'B': return KEY_DOWN;
                case 'C': return KEY_RIGHT;
                case 'D': return KEY_LEFT;
            }
        }
        
        return '\033'; // Unrecognized escape sequence
    }
    
    return key;
}

void flushinp(void) {
//    tcflush(STDIN_FILENO, TCIFLUSH);
}

int savetty() {
//    tcgetattr(STDIN_FILENO, &orig_termios);
    return true;
}

int resetty() {
//    tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios);
    return true;
}

int cbreak() {
//    raw_termios.c_lflag &= ~ICANON;
//    tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw_termios);
    return true;
}

int nocbreak() {
//    raw_termios.c_lflag |= ICANON;
//    tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw_termios);
    return false;
}

#define box(win, v, h)      wborder(win, v, v, h, h, 0, 0, 0, 0)
#define RENDER_WITH_DEFAULT(ch,def) ch = ((ch == 0) ? def : ch)

int wborder(int win,
    chtype ls, chtype rs,
    chtype ts, chtype bs,
    chtype tl, chtype tr,
    chtype bl, chtype br)
{
    int y, x, curx, cury, i;

    RENDER_WITH_DEFAULT(ls, ACS_VLINE);
    RENDER_WITH_DEFAULT(rs, ACS_VLINE);
    RENDER_WITH_DEFAULT(ts, ACS_HLINE);
    RENDER_WITH_DEFAULT(bs, ACS_HLINE);
    RENDER_WITH_DEFAULT(tl, ACS_ULCORNER);
    RENDER_WITH_DEFAULT(tr, ACS_URCORNER);
    RENDER_WITH_DEFAULT(bl, ACS_LLCORNER);
    RENDER_WITH_DEFAULT(br, ACS_LRCORNER);

    getmaxyx(win, y, x); 
    y--; 
    x--;
    
    getyx(stdscr, cury, curx);
    
    mvaddch(0, 0, tl);
    mvaddch(y, 0, bl);
    mvaddch(0, x, tr);
    mvaddch(y, x, br);
    
    for (i = 1; i < y; i++) {
        mvaddch(i, 0, ls);
        mvaddch(i, x, rs);
    }
    
    for (i = 1; i < x; i++) {
        mvaddch(0, i, ts);
        mvaddch(y, i, bs);
    }
    
    move(cury, curx);
    return true;
}

int napms(int ms) {
    // Use usleep for more accurate sleep
    //usleep(ms * 1000);
    return true;
}