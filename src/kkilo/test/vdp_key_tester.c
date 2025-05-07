#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

// Callback function for key events
void key_event_handler(KEY_EVENT key_event) {
    vdp_cursor_tab(0, 15);
    printf("KEY EVENT HANDLER:                    \n");
    printf("ASCII: 0x%02X (%d)                    \n", key_event.ascii, key_event.ascii);
    printf("MODS: 0x%02X                          \n", key_event.mods);
    printf("CODE: 0x%02X                          \n", key_event.code);
    printf("DOWN: %d                              \n", key_event.down);
    printf("Raw Key Data: 0x%08X                  \n", key_event.key_data);
}

void display_key_state() {
    vdp_cursor_tab(0, 22);
    printf("Key State Bits:                       \n");
    for (int i = 0; i < 32; i++) {
        if (i % 8 == 0) printf("\n");
        printf("%02X ", vdp_key_bits[i]);
    }
}

int main() {
    int c;
    char key_name[32];
    FILE *log;
    
    vdp_clear_screen();
    printf("VDP Key Input Tester\n");
    printf("====================\n\n");
    printf("This program tests both standard input and VDP key events\n");
    printf("Press keys to see their detailed info (Ctrl+C to exit)\n\n");
    
    // Initialize the VDP key handling system
    vdp_key_init();
    
    // Set up the event handler
    vdp_set_key_event_handler(key_event_handler);
    
    // Create/clear the log file
    log = fopen("vdp_key_log.txt", "w");
    fprintf(log, "=== VDP Key Test Started ===\n");
    fprintf(log, "Raw | ASCII | MODS | CODE | DOWN | NAME\n");
    fclose(log);
    
    while(1) {
        // Standard input test
        vdp_cursor_tab(0, 6);
        printf("Awaiting key input via stdio...    \n");
        
        c = getchar();
        
        vdp_cursor_tab(0, 7);
        printf("Standard Input:                    \n");
        printf("Hex: 0x%02X  Dec: %3d              \n", c, c);
        
        // Determine key name
        if (c >= 32 && c <= 126) {
            sprintf(key_name, "ASCII '%c'", c);
        } else {
            switch(c) {
                case 0x0a: strcpy(key_name, "DOWN ARROW"); break;
                case 0x0b: strcpy(key_name, "UP ARROW"); break;
                case 0x0c: strcpy(key_name, "RIGHT ARROW"); break;
                case 0x08: strcpy(key_name, "LEFT ARROW/BACKSPACE"); break;
                case 0x1b: strcpy(key_name, "ESC"); break;
                case 0x0d: strcpy(key_name, "ENTER/RETURN"); break;
                case 0x09: strcpy(key_name, "TAB"); break;
                case 0x7f: strcpy(key_name, "DELETE"); break;
                default:
                    if (c < 32) {
                        sprintf(key_name, "CTRL+%c", c + 64);
                    } else {
                        sprintf(key_name, "UNKNOWN");
                    }
                    break;
            }
        }
        printf("Key: %s                          \n\n", key_name);
        
        // Update key state display
        vdp_update_key_state();
        display_key_state();
        
        // Log the key info
        log = fopen("vdp_key_log.txt", "a");
        fprintf(log, "0x%02X | 0x%02X | - | - | - | %s\n", 
                c, c, key_name);
        fclose(log);
    }
    
    return 0;
}