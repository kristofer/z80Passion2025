#include "vt100.h"
#include <agon/vdp_vdp.h>

/* Initialize terminal for raw mode */
void term_init(void) {

    vdp_console_mode(1)

    /* Clear screen and make cursor visible */
    printf(VT100_CLEAR_SCREEN);
    printf(VT100_CURSOR_HOME);
    printf(VT100_CURSOR_VISIBILITY "h"); /* Show cursor */
}

/* Restore original terminal settings */
void term_end(void) {
    printf(VT100_CURSOR_VISIBILITY "h"); /* Show cursor */
    printf(VT100_STANDOUT_OFF);
    printf(VT100_CLEAR_SCREEN);
    printf(VT100_CURSOR_HOME);
    vdp_console_mode(0);
}

/* Position cursor at (y,x) */
void move(int y, int x) {
    printf(ESC "[%d;%dH", y + 1, x + 1);
}

/* Start standout mode (reverse video) */
void standout(void) {
    printf(VT100_STANDOUT_ON);
}

/* End standout mode */
void standend(void) {
    printf(VT100_STANDOUT_OFF);
}

/* Add a string at current cursor position */
void addstr(const char *str) {
    printf("%s", str);
}

/* Add a character at current cursor position */
void addch(int ch) {
    putchar(ch);
}

/* Clear from cursor to end of line */
void clrtoeol(void) {
    printf(VT100_CLEAR_EOL);
}

/* Flush output to terminal */
void refresh(void) {
    fflush(stdout);
}

/* Read a character from terminal */
// int getch(void) {
//     char c;
//     if (read(STDIN_FILENO, &c, 1) != 1) 
//         return -1;
    
//     /* Handle escape sequences */
//     if (c == '\033') {
//         char seq[4];
        
//         /* Read up to 3 more bytes */
//         if (read(STDIN_FILENO, &seq[0], 1) != 1) return '\033';
//         if (read(STDIN_FILENO, &seq[1], 1) != 1) return '\033';
        
//         /* Arrow keys, home, end, etc. */
//         if (seq[0] == '[') {
//             if (seq[1] >= '0' && seq[1] <= '9') {
//                 if (read(STDIN_FILENO, &seq[2], 1) != 1) return '\033';
//                 if (seq[2] == '~') {
//                     switch (seq[1]) {
//                         case '3': return '\033'; /* DEL key */
//                         case '5': return '\033'; /* Page Up */
//                         case '6': return '\033'; /* Page Down */
//                     }
//                 }
//             } else {
//                 switch (seq[1]) {
//                     case 'A': return '\033'; /* Up */
//                     case 'B': return '\033'; /* Down */
//                     case 'C': return '\033'; /* Right */
//                     case 'D': return '\033'; /* Left */
//                     case 'H': return '\033'; /* Home */
//                     case 'F': return '\033'; /* End */
//                 }
//             }
//         } else if (seq[0] == 'O') {
//             switch (seq[1]) {
//                 case 'H': return '\033'; /* Home */
//                 case 'F': return '\033'; /* End */
//             }
//         }
        
//         /* Return complete escape sequence */
//         ungetc(seq[1], stdin);
//         ungetc(seq[0], stdin);
//         return '\033';
//     }
    
//     return c;
// }
