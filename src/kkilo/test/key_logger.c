#include <stdio.h>
#include <stdlib.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

int main() {
    FILE *log;
    int c;
    
    vdp_clear_screen();
    printf("Key Logger Test Utility\n");
    printf("Press keys to log their hex values (Ctrl+C to exit)\n");
    printf("Logging to keylog.txt\n\n");
    
    // Create/clear the log file
    log = fopen("keylog.txt", "w");
    fprintf(log, "--- Key Logger Session Started ---\n");
    fclose(log);
    
    while(1) {
        c = getchar();
        
        // Log to file
        log = fopen("keylog.txt", "a");
        fprintf(log, "Key: 0x%02X (%d)\n", c, c);
        fclose(log);
        
        // Display on screen
        vdp_cursor_tab(0, 5);
        printf("Last key: 0x%02X (%d)     \n", c, c);
    }
    
    return 0;
}