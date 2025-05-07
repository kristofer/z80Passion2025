#include <stdio.h>
//#include <stdlib.h>
#include <string.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

// Structure to record key history
#define HISTORY_SIZE 20
typedef struct {
    int raw_code;
    int mapped_code;
    char description[32];
} key_record;

key_record history[HISTORY_SIZE];
int history_index = 0;

// Map key codes to user-friendly descriptions
void map_key_code(int code, int *mapped, char *desc) {
    *mapped = code; // Default to same code

    if (code >= 32 && code <= 126) {
        sprintf(desc, "ASCII '%c'", code);
        return;
    }

    switch(code) {
        case 0x0a:
            strcpy(desc, "DOWN ARROW");
            *mapped = 1001; // ARROW_DOWN in kilo.c
            break;
        case 0x0b:
            strcpy(desc, "UP ARROW");
            *mapped = 1000; // ARROW_UP in kilo.c
            break;
        case 0x0c:
            strcpy(desc, "RIGHT ARROW");
            *mapped = 999; // ARROW_RIGHT in kilo.c
            break;
        case 0x08:
            strcpy(desc, "LEFT ARROW");
            *mapped = 998; // ARROW_LEFT in kilo.c
            break;
        case 0x1b:
            strcpy(desc, "ESC");
            break;
        case 0x0d:
            strcpy(desc, "ENTER/RETURN");
            break;
        case 0x09:
            strcpy(desc, "TAB");
            break;
        case 0x7f:
            strcpy(desc, "DELETE");
            *mapped = 1002; // DEL_KEY in kilo.c
            break;
        case 0x02: // Ctrl+B - could be HOME on some systems
            strcpy(desc, "CTRL+B (HOME?)");
            *mapped = 1003; // HOME_KEY in kilo.c
            break;
        case 0x05: // Ctrl+E - could be END on some systems
            strcpy(desc, "CTRL+E (END?)");
            *mapped = 1004; // END_KEY in kilo.c
            break;
        default:
            if (code < 32) {
                sprintf(desc, "CTRL+%c", code + 64);
            } else {
                sprintf(desc, "UNKNOWN (0x%02X)", code);
            }
            break;
    }
}

// Add a key to history
void add_to_history(int raw_code) {
    int mapped;
    char desc[32];

    map_key_code(raw_code, &mapped, desc);

    history[history_index].raw_code = raw_code;
    history[history_index].mapped_code = mapped;
    strcpy(history[history_index].description, desc);

    history_index = (history_index + 1) % HISTORY_SIZE;
}

// Display the key history
void display_history() {
    vdp_cursor_tab(0, 12);
    printf("Key History (newest first):                       \n");
    printf("----------------------------------------------    \n");
    printf("RAW  | MAPPED | DESCRIPTION                       \n");
    printf("----------------------------------------------    \n");

    for (int i = 0; i < HISTORY_SIZE; i++) {
        int idx = (history_index - i - 1 + HISTORY_SIZE) % HISTORY_SIZE;

        // Only show entries with valid data
        if (history[idx].raw_code != 0) {
            printf("0x%02X | 0x%04X | %-30s\n",
                  history[idx].raw_code,
                  history[idx].mapped_code,
                  history[idx].description);
        }
    }
}

int main() {
    int c;
    int mapped_code;
    char key_desc[32];
    FILE *log;

    // Initialize history
    for (int i = 0; i < HISTORY_SIZE; i++) {
        history[i].raw_code = 0;
        history[i].mapped_code = 0;
        history[i].description[0] = '\0';
    }

    vdp_clear_screen();
    printf("Arrow Key Test Utility\n");
    printf("=====================\n\n");
    printf("This utility tests Agon arrow key handling for kilo editor\n");
    printf("Press arrow keys and other navigation keys to see how they map\n");
    printf("Press Ctrl+C to exit\n\n");
    fflush(stdout);

    // Create/clear the log file
    log = fopen("arrow_key_log.txt", "w");
    fprintf(log, "=== Arrow Key Test Started ===\n");
    fprintf(log, "RAW | MAPPED | DESCRIPTION\n");
    fclose(log);

    while(1) {
        vdp_cursor_tab(0, 7);
        printf("Waiting for keypress...                       \n");

        c = getchar();
        add_to_history(c);

        map_key_code(c, &mapped_code, key_desc);

        vdp_cursor_tab(0, 7);
        printf("Raw key code: 0x%02X (%d)                     \n", c, c);
        printf("Mapped to: 0x%04X                             \n", mapped_code);
        printf("Description: %s                               \n\n", key_desc);

        display_history();

        // Log to file
        log = fopen("arrow_key_log.txt", "a");
        fprintf(log, "0x%02X | 0x%04X | %s\n", c, mapped_code, key_desc);
        fclose(log);
    }

    return 0;
}
