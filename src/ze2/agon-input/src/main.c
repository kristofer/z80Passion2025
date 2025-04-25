/**
 * Agon Light Keyboard Input Sample
 * 
 * This program demonstrates how to capture and display keyboard input
 * on the Agon Light, including special control characters.
 */

 #include <stdio.h>
 #include <stdlib.h>
 #include <stdint.h>
 #include <string.h>
 #include "../../src/acurses.h"

 // Agon VDP control codes
 #define VDP_CLS         0x0C    // Clear screen
 #define VDP_TEXTCOLOR   0x1B    // ESC followed by command
 
 // Keyboard input port - may need adjustment based on actual hardware
 #define KEYBOARD_DATA_PORT      0x08
 #define KEYBOARD_STATUS_PORT    0x09
 
 // Status flags
 #define KB_STATUS_DATA_READY    0x01
 
 /**
  * Wait for and read a character from keyboard
  */
//  int getch(void) {
//      // Wait until a key is available
//      while (!(inp(KEYBOARD_STATUS_PORT) & KB_STATUS_DATA_READY)) {
//          // Wait loop
//      }
     
//      // Read the key
//      return inp(KEYBOARD_DATA_PORT);
//  }
 
 /**
  * Display character name for control characters
  */
 void print_char_info(int ch) {
     // Display the character code
     printf("ASCII: %d (0x%02X) ", ch, ch);
     
     // Display character name for control characters
     if (ch < 32) {
         printf("- Control character: ");
         switch (ch) {
             case 0:  printf("NUL (Null)"); break;
             case 1:  printf("SOH (Start of Heading)"); break;
             case 2:  printf("STX (Start of Text)"); break;
             case 3:  printf("ETX (End of Text/Ctrl-C)"); break;
             case 4:  printf("EOT (End of Transmission)"); break;
             case 5:  printf("ENQ (Enquiry)"); break;
             case 6:  printf("ACK (Acknowledgement)"); break;
             case 7:  printf("BEL (Bell)"); break;
             case 8:  printf("BS (Backspace)"); break;
             case 9:  printf("HT (Horizontal Tab)"); break;
             case 10: printf("LF (Line Feed)"); break;
             case 11: printf("VT (Vertical Tab)"); break;
             case 12: printf("FF (Form Feed)"); break;
             case 13: printf("CR (Carriage Return)"); break;
             case 14: printf("SO (Shift Out)"); break;
             case 15: printf("SI (Shift In)"); break;
             case 16: printf("DLE (Data Link Escape)"); break;
             case 17: printf("DC1 (Device Control 1/XON)"); break;
             case 18: printf("DC2 (Device Control 2)"); break;
             case 19: printf("DC3 (Device Control 3/XOFF)"); break;
             case 20: printf("DC4 (Device Control 4)"); break;
             case 21: printf("NAK (Negative Acknowledgement)"); break;
             case 22: printf("SYN (Synchronous Idle)"); break;
             case 23: printf("ETB (End of Transmission Block)"); break;
             case 24: printf("CAN (Cancel)"); break;
             case 25: printf("EM (End of Medium)"); break;
             case 26: printf("SUB (Substitute/Ctrl-Z)"); break;
             case 27: printf("ESC (Escape)"); break;
             case 28: printf("FS (File Separator)"); break;
             case 29: printf("GS (Group Separator)"); break;
             case 30: printf("RS (Record Separator)"); break;
             case 31: printf("US (Unit Separator)"); break;
             default: printf("Unknown control character"); break;
         }
     } else if (ch == 127) {
         printf("- DEL (Delete)");
     } else {
         printf("- Character: '%c'", ch);
     }
     
     printf("\n");
 }
 
 /**
  * Display a key visually, including control characters
  */
 void display_key(int ch) {
    vdp_set_text_colour( COLOR_RED );
     // Display control characters in a special way
     if (ch < 32) {
         printf("^%c", ch + 64);  // Show as ^A, ^B, etc.
     } else if (ch == 127) {
         printf("^?");            // DEL character
     } else {
         printf("%c", ch);        // Normal character
     }
     vdp_set_text_colour( COLOR_WHITE );

 }
 
 /**
  * Clear the screen and move cursor to home position
  */
 void clear_screen(void) {
     putchar(VDP_CLS);
 }
 
 /**
  * Main program
  */
 int main() {
     int ch;
     int exit_flag = 0;
     
     clear_screen();
     printf("Agon Light Keyboard Input Sample\n");
     printf("-------------------------------\n");
     printf("Press keys to see their codes and representation.\n");
     printf("Press ESC three times to exit.\n\n");
     
     int esc_count = 0;
     
     while (!exit_flag) {
         // Get character from keyboard
         ch = getchar();
         
         // Check for triple ESC to exit
         if (ch == 27) {
             esc_count++;
             if (esc_count >= 3) {
                 exit_flag = 1;
                 continue;
             }
         } else {
             esc_count = 0;
         }
         
         // Display the key pressed
         printf("Key pressed: ");
         display_key(ch);
         printf("  ");
         print_char_info(ch);
         printf("\n");
     }
     
     printf("\nProgram terminated.\n");
     return 0;
 }