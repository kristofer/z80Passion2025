#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

#define HISTORY_SIZE 10

void draw_border(int x, int y, int width, int height) {
    int i;
    
    // Draw top border
    vdp_cursor_tab(x, y);
    printf("+");
    for (i = 0; i < width-2; i++) printf("-");
    printf("+");
    
    // Draw sides
    for (i = 1; i < height-1; i++) {
        vdp_cursor_tab(x, y+i);
        printf("|");
        vdp_cursor_tab(x+width-1, y+i);
        printf("|");
    }
    
    // Draw bottom border
    vdp_cursor_tab(x, y+height-1);
    printf("+");
    for (i = 0; i < width-2; i++) printf("-");
    printf("+");
}

int main() {
    int c;
    int history[HISTORY_SIZE] = {0};
    int history_pos = 0;
    char key_name[32];
    
    vdp_clear_screen();
    printf("Key Visualizer Test Utility\n");
    printf("Press keys to see their values (Ctrl+C to exit)\n\n");
    
    // Draw visualization frame
    draw_border(2, 4, 40, 15);
    
    vdp_cursor_tab(4, 5);
    printf("Last Key:");
    
    vdp_cursor_tab(4, 7);
    printf("Key History:");
    
    vdp_cursor_tab(4, 13);
    printf("ASCII/Name:");
    
    while(1) {
        c = getchar();
        
        // Add to history
        history[history_pos] = c;
        history_pos = (history_pos + 1) % HISTORY_SIZE;
        
        // Display current key
        vdp_cursor_tab(15, 5);
        printf("0x%02X (%3d)     ", c, c);
        
        // Display history
        for (int i = 0; i < HISTORY_SIZE; i++) {
            int idx = (history_pos - i - 1 + HISTORY_SIZE) % HISTORY_SIZE;
            vdp_cursor_tab(15 + i*2, 8);
            if (history[idx] != 0) {
                printf("%02X", history[idx]);
            } else {
                printf("  ");
            }
        }
        
        // Display ASCII or special key name
        vdp_cursor_tab(15, 13);
        if (c >= 32 && c <= 126) {
            // Printable ASCII
            printf("'%c'         ", c);
        } else {
            // Special key
            switch(c) {
                case 0x0a: strcpy(key_name, "DOWN ARROW"); break;
                case 0x0b: strcpy(key_name, "UP ARROW"); break;
                case 0x0c: strcpy(key_name, "RIGHT ARROW"); break;
                case 0x08: strcpy(key_name, "LEFT ARROW/BACKSPACE"); break;
                case 0x1b: strcpy(key_name, "ESC"); break;
                case 0x0d: strcpy(key_name, "ENTER/RETURN"); break;
                case 0x09: strcpy(key_name, "TAB"); break;
                default: sprintf(key_name, "CTRL+%c", c + 64); break;
            }
            printf("%-18s", key_name);
        }
    }
    
    return 0;
}