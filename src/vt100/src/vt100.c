#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <agon/vdp_vdu.h>

#include "acurses.h"


volatile SYSVAR *sysvid;
char _curse_buf[512];

/* Initialize terminal for raw mode */
void term_init(void) {
	sysvid = vdp_vdu_init();
    char temp[20];
    clear();
    move(10,10);
    addstr("Hello, World! Working");
    move(12,0);
    addstr("And Another String.");

    for (int i = 0; i < 60; i++) {
        move(i,0);
        addstr("Line ");
        sprintf(temp, "%d", i);
        addstr(temp);
    }
    int maxy = getmaxy(0);
    move(maxy-1,0);
    addstr("Press any key to continue...");
    refresh();
}

/* Restore original terminal settings */
void term_end(void) {
    // VDP_PUTS(VT100_CURSOR_VISIBILITY "h"); /* Show cursor */
    // VDP_PUTS(VT100_STANDOUT_OFF);
    vdp_clear_screen();

    vdp_console_mode(0);
}


int main() {
    term_init();

    int ch = getch();
    if (ch != -1) {
        addch(ch);
    }

    term_end();
    return 0;
}