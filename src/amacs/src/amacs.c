#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
//#include <unistd.h>
#include <agon/vdp_vdu.h>
//#include <agon/vdp_vdu.h>

#include "acurses.h"

#define VERSION "a.1.0"
#define MAX_LINES 5000
#define MAX_LINE_LEN 256
#define CTRL(x) ((x) & 0x1f)

/* Data types */
typedef struct {
    char *text;
    int length;
} Line;

typedef struct {
    Line *lines;
    int num_lines;
    int cx, cy;          // Cursor position
    int scroll_offset;   // First visible line
    int screen_rows;
    int screen_cols;
    char *filename;
    char statusmsg[80];
    int modified;
} Editor;

Editor E;

/* Function prototypes */
void editor_init(void);
void editor_refresh_screen(void);
void editor_process_keypress(void);
void editor_insert_char(int c);
void editor_delete_char(void);
void editor_insert_newline(void);
void editor_open(char *filename);
void editor_save(void);
void editor_set_status_message(const char *fmt, ...);

uint8_t screen_mode;

/* Terminal handling */
void term_init(void) {
    // Get screen dimensions
    uint8_t screen_width = 80;
    uint8_t screen_height = 30;
    //uint8_t mode = mos_sysvars()->vdp_pflag_mode & 0x7F;
    
    // volatile SYSVAR *sysvid = mos_sysvars();
    // screen_mode = sysvid->vdp_mode;
    // screen_height = sysvid->vdp_scrRows;
    // screen_width = sysvid->vdp_scrCols;
    // Mode dimensions are in the Agon documentation - this is approximate
    // switch(mode) {
    //     case 0: screen_width = 40; screen_height = 30; break;
    //     case 1: screen_width = 40; screen_height = 30; break;
    //     case 2: screen_width = 80; screen_height = 30; break;
    //     case 3: screen_width = 80; screen_height = 30; break;
    //     case 4: screen_width = 40; screen_height = 24; break;
    //     case 5: screen_width = 40; screen_height = 24; break;
    //     case 6: screen_width = 80; screen_height = 24; break;
    //     case 7: screen_width = 80; screen_height = 24; break;
    //     case 8: screen_width = 80; screen_height = 32; break;
    //     case 9: screen_width = 80; screen_height = 32; break;
    //     default: screen_width = 80; screen_height = 30; break;
    // }
    
    E.screen_cols = screen_width;
    E.screen_rows = screen_height - 2; // Reserve space for status line
    
    // Clear screen
    // vdp_clear_screen();
    // vdp_console_mode(1);
    // vdp_cursor_home();
    initscr();
}

void term_cleanup(void) {
    vdp_clear_screen();
    vdp_cursor_home();
    vdp_console_mode(0);
    endwin();
}

/* Editor initialization */
void editor_init(void) {
    E.cx = 0;
    E.cy = 0;
    E.scroll_offset = 0;
    E.num_lines = 0;
    E.modified = 0;
    E.filename = NULL;
    E.statusmsg[0] = '\0';
    
    // Allocate memory for lines
    E.lines = malloc(sizeof(Line) * MAX_LINES);
    for (int i = 0; i < MAX_LINES; i++) {
        E.lines[i].text = NULL;
        E.lines[i].length = 0;
    }
}

/* Line operations */
void editor_append_line(char *s, size_t len) {
    if (E.num_lines >= MAX_LINES) return;
    
    E.lines[E.num_lines].text = malloc(len + 1);
    memcpy(E.lines[E.num_lines].text, s, len);
    E.lines[E.num_lines].text[len] = '\0';
    E.lines[E.num_lines].length = len;
    E.num_lines++;
    E.modified = 1;
}

void editor_insert_line(int at, char *s, size_t len) {
    if (at < 0 || at > E.num_lines || E.num_lines >= MAX_LINES) return;
    
    // Move lines down
    for (int i = E.num_lines; i > at; i--) {
        E.lines[i] = E.lines[i-1];
    }
    
    E.lines[at].text = malloc(len + 1);
    memcpy(E.lines[at].text, s, len);
    E.lines[at].text[len] = '\0';
    E.lines[at].length = len;
    E.num_lines++;
    E.modified = 1;
}

void editor_free_line(int at) {
    if (at < 0 || at >= E.num_lines) return;
    free(E.lines[at].text);
}

void editor_delete_line(int at) {
    if (at < 0 || at >= E.num_lines) return;
    
    editor_free_line(at);
    
    // Move lines up
    for (int i = at; i < E.num_lines - 1; i++) {
        E.lines[i] = E.lines[i+1];
    }
    
    E.num_lines--;
    E.modified = 1;
}

/* Editing operations */
void editor_insert_char(int c) {
    // If cursor is past end of file, add a new line
    if (E.cy == E.num_lines) {
        editor_append_line("", 0);
    }
    
    // Get current line
    Line *line = &E.lines[E.cy];
    
    // Make room for the new character
    line->text = realloc(line->text, line->length + 2);
    memmove(&line->text[E.cx + 1], &line->text[E.cx], line->length - E.cx + 1);
    line->text[E.cx] = c;
    line->length++;
    E.cx++;
    E.modified = 1;
}

void editor_delete_char(void) {
    if (E.cy == E.num_lines) return;
    if (E.cx == 0 && E.cy == 0) return;
    
    Line *line = &E.lines[E.cy];
    
    if (E.cx > 0) {
        // Delete character before cursor
        memmove(&line->text[E.cx - 1], &line->text[E.cx], line->length - E.cx + 1);
        line->length--;
        E.cx--;
        E.modified = 1;
    } else {
        // At beginning of line, join with previous line
        if (E.cy > 0) {
            Line *prev = &E.lines[E.cy - 1];
            int prev_len = prev->length;
            
            // Append current line to previous line
            prev->text = realloc(prev->text, prev_len + line->length + 1);
            memcpy(&prev->text[prev_len], line->text, line->length + 1);
            prev->length += line->length;
            
            // Delete current line
            editor_delete_line(E.cy);
            E.cy--;
            E.cx = prev_len;
        }
    }
}

void editor_insert_newline(void) {
    if (E.cx == 0) {
        // At beginning of line, insert a blank line
        editor_insert_line(E.cy, "", 0);
    } else {
        // Split the line
        Line *line = &E.lines[E.cy];
        editor_insert_line(E.cy + 1, &line->text[E.cx], line->length - E.cx);
        
        // Truncate current line
        line->text = realloc(line->text, E.cx + 1);
        line->text[E.cx] = '\0';
        line->length = E.cx;
    }
    E.cy++;
    E.cx = 0;
}

/* File I/O */
void editor_open(char *filename) {
    FILE *fp = fopen(filename, "r");
    if (!fp) {
        // New file
        editor_append_line("", 0);
        E.filename = strdup(filename);
        editor_set_status_message("New file: %s", filename);
        return;
    }
    
    free(E.filename);
    E.filename = strdup(filename);
    
    char line[MAX_LINE_LEN];
    while (fgets(line, sizeof(line), fp)) {
        // Trim trailing newline
        int len = strlen(line);
        if (len > 0 && (line[len - 1] == '\n' || line[len - 1] == '\r'))
            line[--len] = '\0';
        
        editor_append_line(line, len);
    }
    
    fclose(fp);
    E.modified = 0;
    editor_set_status_message("File loaded: %s", filename);
}

void editor_save(void) {
    if (E.filename == NULL) {
        // Default filename if none provided
        E.filename = strdup("untitled.txt");
    }
    
    FILE *fp = fopen(E.filename, "w");
    if (!fp) {
        editor_set_status_message("Error: Can't save file!");
        return;
    }
    
    for (int i = 0; i < E.num_lines; i++) {
        fputs(E.lines[i].text, fp);
        fputc('\n', fp);
    }
    
    fclose(fp);
    E.modified = 0;
    editor_set_status_message("File saved: %s", E.filename);
}

/* Screen update */
void editor_scroll(void) {
    // Scroll if cursor is above or below visible area
    if (E.cy < E.scroll_offset) {
        E.scroll_offset = E.cy;
    }
    if (E.cy >= E.scroll_offset + E.screen_rows) {
        E.scroll_offset = E.cy - E.screen_rows + 1;
    }
    
    // Adjust cursor position if at end of line
    if (E.cy < E.num_lines && E.cx > E.lines[E.cy].length) {
        E.cx = E.lines[E.cy].length;
    }
}

void editor_draw_rows(void) {
    for (int y = 0; y < E.screen_rows; y++) {
        int filerow = y + E.scroll_offset;
        int len = E.lines[filerow].length;
        vdp_cursor_tab(y, 0);

        if (filerow >= E.num_lines) {
            // Draw tilde for empty lines
            mos_puts("~", 1, 0);
        } else {
            // Draw line content
            if (len > E.screen_cols) len = E.screen_cols;
            
            mos_puts(E.lines[filerow].text, len, 0);
        }
        
        // Clear to end of line
        // for (int i = len; i < E.screen_cols; i++) {
        //     mos_puts(" ", 1, 0);
        // }
    }
}

void editor_draw_status_bar(void) {
    // Set inverse video
    
    vdp_cursor_tab(E.screen_rows, 0);
    
    char status[80], rstatus[20];
    int len = snprintf(status, sizeof(status), "%.20s - %d lines %s",
                      E.filename ? E.filename : "[No Name]", E.num_lines,
                      E.modified ? "(modified)" : "");
    int rlen = snprintf(rstatus, sizeof(rstatus), "%d:%d",
                       E.cy + 1, E.cx + 1);
    
    if (len > E.screen_cols) len = E.screen_cols;
    mos_puts(status, len, 0);
    
    // Fill with spaces and add right-aligned status
    for (int i = len; i < E.screen_cols - rlen; i++) {
        mos_puts(" ", 1, 0);
    }
    
    mos_puts(rstatus, rlen, 0);
    
    // Reset color

}

void editor_draw_message_bar(void) {
    vdp_cursor_tab(E.screen_rows + 1, 0);
    for (int i = 0; i < E.screen_cols; i++) {
        mos_puts(" ", 1, 0); // Clear the line //BLEECCH!!
    }
    vdp_cursor_tab(E.screen_rows + 1, 0);
    
    int msglen = strlen(E.statusmsg);
    if (msglen > E.screen_cols) msglen = E.screen_cols;
    if (msglen > 0) {
        mos_puts(E.statusmsg, msglen, 0);
    }
}

void editor_refresh_screen(void) {
    editor_scroll();
    
    // Hide cursor during redraw
    curs_set(0);
    move(0,0);
    // Draw all components
    editor_draw_rows();
    editor_draw_status_bar();
    editor_draw_message_bar();
    
    // Position cursor
    vdp_cursor_tab(E.cy - E.scroll_offset, E.cx);
    
    // Show cursor
    curs_set(1);
}

void editor_set_status_message(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(E.statusmsg, sizeof(E.statusmsg), fmt, ap);
    va_end(ap);
}

/* Input handling */
void editor_move_cursor(int key) {
    switch (key) {
        case 'h': // Left
        case 8:   // Backspace/left arrow on Agon
            if (E.cx > 0) {
                E.cx--;
            } else if (E.cy > 0) {
                E.cy--;
                E.cx = E.lines[E.cy].length;
            }
            break;
            
        case 'l': // Right
        case 9:   // Tab/right arrow on Agon
            if (E.cy < E.num_lines && E.cx < E.lines[E.cy].length) {
                E.cx++;
            } else if (E.cy < E.num_lines - 1) {
                E.cy++;
                E.cx = 0;
            }
            break;
            
        case 'k': // Up
        case 11:  // Up arrow on Agon
            if (E.cy > 0) E.cy--;
            break;
            
        case 'j': // Down
        case 10:  // Down arrow on Agon
            if (E.cy < E.num_lines - 1) E.cy++;
            break;
    }
    
    // Make sure cursor is not past the end of the line
    if (E.cy < E.num_lines && E.cx > E.lines[E.cy].length) {
        E.cx = E.lines[E.cy].length;
    }
}

void editor_process_keypress(void) {
    static char keybuf[3] = {0};
    int c = getchar();
    
    // Handle special keys
    if (c == 27) { // ESC or special key sequence
        keybuf[0] = c;
        keybuf[1] = getchar();
        if (keybuf[1] == '[') {
            keybuf[2] = getchar();
            
            switch (keybuf[2]) {
                case 'A': editor_move_cursor(11); return; // Up
                case 'B': editor_move_cursor(10); return; // Down
                case 'C': editor_move_cursor(9); return;  // Right
                case 'D': editor_move_cursor(8); return;  // Left
            }
        }
        return; // Unhandled escape sequence
    }
    
    // Regular key handling
    switch (c) {
        case CTRL('q'):
            if (E.modified) {
                editor_set_status_message("File has unsaved changes. Press Ctrl-Q again to quit.");
                E.modified = 2; // Marked as "warned"
                return;
            }
            if (E.modified == 2) {
                // User confirmed exit with unsaved changes
                term_cleanup();
                exit(0);
            }
            term_cleanup();
            exit(0);
            break;
            
        case CTRL('s'):
            editor_save();
            break;
            
        case CTRL('f'):
            editor_set_status_message("Search not implemented");
            break;
            
        case 13: // Enter
            editor_insert_newline();
            break;
            
        case 8: // Backspace
        case 127: // Also backspace on some systems
            editor_delete_char();
            break;
            
        default:
            if (!iscntrl(c)) {
                editor_insert_char(c);
            }
            break;
    }
}

/* Main function */
int main(int argc, char *argv[]) {
    // Initialize terminal and editor
    term_init();
    editor_init();
    
    // Load file if specified
    if (argc >= 2) {
        editor_open(argv[1]);
    } else {
        // Start with an empty file
        editor_append_line("", 0);
    }
    
    editor_set_status_message("HELP: Ctrl-S = save | Ctrl-Q = quit");
    
    // Main loop
    while (1) {
        editor_refresh_screen();
        editor_process_keypress();
    }
    
    return 0;
}
