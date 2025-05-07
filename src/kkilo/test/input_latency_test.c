#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

// Simple circular buffer for recording key timing
#define BUFFER_SIZE 20
typedef struct {
    int key;
    clock_t timestamp;
} key_record_t;

key_record_t key_history[BUFFER_SIZE];
int history_pos = 0;
int history_count = 0;

void add_key_record(int key, clock_t time) {
    key_history[history_pos].key = key;
    key_history[history_pos].timestamp = time;
    history_pos = (history_pos + 1) % BUFFER_SIZE;
    if (history_count < BUFFER_SIZE)
        history_count++;
}

void display_statistics() {
    clock_t total_delta = 0;
    int count = 0;
    
    if (history_count < 2) {
        printf("Need more keypresses for statistics       \n");
        return;
    }
    
    // Calculate time differences between consecutive keypresses
    for (int i = 1; i < history_count; i++) {
        int curr = (history_pos - i + BUFFER_SIZE) % BUFFER_SIZE;
        int prev = (history_pos - i - 1 + BUFFER_SIZE) % BUFFER_SIZE;
        
        clock_t delta = key_history[curr].timestamp - key_history[prev].timestamp;
        total_delta += delta;
        count++;
    }
    
    // Avoid division by zero
    if (count == 0) return;
    
    clock_t avg_delta = total_delta / count;
    
    vdp_cursor_tab(0, 12);
    printf("Key input statistics:                     \n");
    printf("Average time between keys: %ld clock ticks\n", avg_delta);
    printf("In milliseconds: ~%ld ms                  \n", 
           (avg_delta * 1000) / CLOCKS_PER_SEC);
}

int main() {
    int c;
    clock_t key_time;
    
    vdp_clear_screen();
    printf("Input Latency Test Utility\n");
    printf("-------------------------\n");
    printf("Press keys in a consistent rhythm to measure timing\n");
    printf("Press Ctrl+C to exit\n\n");
    
    while(1) {
        vdp_cursor_tab(0, 6);
        printf("Waiting for keypress...            ");
        
        c = getchar();
        key_time = clock();
        
        vdp_cursor_tab(0, 6);
        printf("Key detected: 0x%02X at time %ld    \n", c, key_time);
        
        // Record the key timing
        add_key_record(c, key_time);
        
        // Show recent key history
        vdp_cursor_tab(0, 8);
        printf("Recent key timing (newest first):   \n");
        for (int i = 0; i < 3 && i < history_count; i++) {
            int idx = (history_pos - i - 1 + BUFFER_SIZE) % BUFFER_SIZE;
            printf("Key: 0x%02X, Time: %ld          \n", 
                   key_history[idx].key, 
                   key_history[idx].timestamp);
        }
        
        // Display statistics after we have some data
        display_statistics();
    }
    
    return 0;
}