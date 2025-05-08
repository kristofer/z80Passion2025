#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>
#include <stdbool.h>

#define MAX_KEYS 100

typedef struct {
    int key_code;
    time_t timestamp;
} key_event_t;

int main() {
    key_event_t events[MAX_KEYS];
    int event_count = 0;
    int c;
    time_t start_time;
    char timestamp_buf[20];
    FILE *log = NULL;
    bool running = true;
    
    // Initialize VDP key handling
    vdp_key_init();
    
    vdp_clear_screen();
    printf("Key Event Tester\n");
    printf("Records timing and sequence of keypresses\n");
    printf("Press keys to test (Ctrl+C to exit, Ctrl+P to print report)\n\n");
    
    // Create/clear the log file
    log = fopen("key_event_log.txt", "w");
    if (log) {
        fprintf(log, "=== Key Event Test Started ===\n");
        fprintf(log, "Index | Key Code | Time (sec)\n");
        fprintf(log, "-----------------------------\n");
        fclose(log);
    } else {
        printf("Warning: Could not create log file\n");
    }
    
    // Open log file for appending
    log = fopen("key_event_log.txt", "a");
    
    start_time = time(NULL);
    
    while(running) {
        c = getchar();
        
        // Check for exit command (Ctrl+C)
        if (c == 3) {
            printf("Exiting program...\n");
            running = false;
            break;
        }
        
        // Check for print report command
        if (c == 16) { // Ctrl+P
            vdp_clear_screen();
            printf("Key Event Report:\n");
            printf("-----------------\n\n");
            
            printf("%-10s %-10s %-15s\n", "Index", "Key", "Time (sec)");
            printf("----------------------------------------\n");
            
            for (int i = 0; i < event_count; i++) {
                printf("%-10d 0x%-8X %-15ld\n", 
                       i + 1, 
                       events[i].key_code,
                       events[i].timestamp - start_time);
            }
            
            printf("\nPress any key to continue testing...\n");
            getchar();
            vdp_clear_screen();
            printf("Key Event Tester\n");
            printf("Records timing and sequence of keypresses\n");
            printf("Press keys to test (Ctrl+C to exit, Ctrl+P to print report)\n\n");
            continue;
        }
        
        // Record the event
        if (event_count < MAX_KEYS) {
            events[event_count].key_code = c;
            events[event_count].timestamp = time(NULL);
            
            // Log to file if open
            if (log) {
                fprintf(log, "%-10d 0x%-8X %-15ld\n", 
                       event_count + 1, 
                       events[event_count].key_code,
                       events[event_count].timestamp - start_time);
                fflush(log);
            }
            
            event_count++;
        }
        
        // Show latest events on screen
        vdp_cursor_tab(0, 6);
        printf("Recent events (newest first):       \n");
        
        for (int i = 0; i < 10 && i < event_count; i++) {
            int idx = event_count - i - 1;
            long time_diff = events[idx].timestamp - start_time;
            
            vdp_cursor_tab(0, 7 + i);
            printf("%2d: Key 0x%02X at +%lds     \n", 
                   idx + 1, 
                   events[idx].key_code,
                   time_diff);
        }
        
        // Show last key info
        vdp_cursor_tab(0, 20);
        printf("Latest key: 0x%02X (%d)     \n", c, c);
        
        if (c >= 32 && c <= 126) {
            printf("ASCII: '%c'     \n", c);
        } else {
            printf("Special key     \n");
        }
    }
    
    // Clean up
    if (log) {
        fprintf(log, "\n=== Key Event Test Ended ===\n");
        fclose(log);
    }
    
    return 0;
}