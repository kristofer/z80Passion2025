#include <stddef.h>
#include <stdio.h>
#include <stdbool.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>


// ring buffer
#define RING_BUFFER_SIZE 8
// Ring buffer structure
typedef struct {
    char data[RING_BUFFER_SIZE];
    volatile int head;     // Index for reading (consumer)
    volatile int tail;     // Index for writing (producer)
    volatile int count;    // Number of items in the buffer
} RingBuffer;

//extern RingBuffer bufc;
void init_ring_buffer(RingBuffer *buffer);
void appendchar(RingBuffer *buffer, char c);
char headchar(RingBuffer *buffer);
bool charReady(RingBuffer *buffer);
static KEY_EVENT prev_key_event = { 0 };
static RingBuffer rbuf;


// Initialize the buffer
void init_ring_buffer(RingBuffer *buffer) {
    printf("init_buffer\n");
    buffer->head = 0;
    buffer->tail = 0;
    buffer->count = 0;
}

bool charReady(RingBuffer *buffer) {
    return buffer->count != 0;
}
// Add a character to the buffer (called from interrupt handler)
void appendchar(RingBuffer *buffer, char c) {
    // If buffer is full, overwrite oldest data
    if (buffer->count == RING_BUFFER_SIZE) {
        //printf("> appendchar buffer overflow\n");
        buffer->head = (buffer->head + 1) % RING_BUFFER_SIZE; // Move head forward
        buffer->count--; // Make room for new char
    }

    // Add the new character
    //putchar('~'); putchar(c);
    buffer->data[buffer->tail] = c;
    buffer->tail = (buffer->tail + 1) % RING_BUFFER_SIZE;
    buffer->count++;
    //printf("> appendchar %d\n",buffer->count);
}

// Get the character at the head of the buffer (busy-waits if empty)
char headchar(RingBuffer *buffer) {
    //printf("< headchar\n");
    // Wait until there's at least one character
    while (buffer->count == 0) {
        // Busy wait
        waitvblank();
        return '\xFF';
        //printf("+");
    }

    // Get the character
    char c = buffer->data[buffer->head];
    buffer->head = (buffer->head + 1) % RING_BUFFER_SIZE;
    buffer->count--;
    //printf("< headchar %d\n",buffer->count);

    return c;
}
/* end ring buffer */

// MANY 0 key_events
static void key_handler(KEY_EVENT key_event) {
        char c = key_event.ascii;
        prev_key_event = key_event;
        if ((key_event.down != 0) && (key_event.ascii != 0)) {
            if (c >= 32 && c <= 126) {
                printf("kh ascii: 0x%02x \n", c);
                appendchar(&rbuf, c);
            }
        }
        if ((key_event.down != 0) && (key_event.mods != 0)) {
            if (c != 0) {
                printf("kh ctrl: 0x%02x \n", c);
                appendchar(&rbuf, c);
            }
        }
    //vdp_update_key_state();
}


void cursor(char onoff) {
    // Turning off flashing cursor (1 on, 0 off)
    putch(23); putch(1); putch(onoff);
}
// Clear screen
void clrscr() {
    //vdp_mode(3); - Doesn't work, send the characters instead!
    char mode[2] = {22,0};
    mos_puts(mode,2,0);
    vdp_clear_screen();
    cursor(0);
}
// Get character from keyboard
char cgetc() {
    return inchar();
}
// Position cursor
void gotoxy(char x, char y) {
    vdp_cursor_tab(y,x);
}
// Put a character at screen coord
void cputcxy(int x, int y, char c) {
    vdp_cursor_tab(y,x);
    putch(c); putch(8);
}


static volatile SYSVAR *sys_vars = NULL;

int main() {

    init_ring_buffer(&rbuf);

    sys_vars = vdp_vdu_init();

    // Initialize keyboard handling
    if (vdp_key_init() == -1) {
        printf("failed vdp_key_init\n");
        return false;
    }

    // Set our key event handler
    printf("setting input handler\n");
    vdp_set_key_event_handler(key_handler);

    int c = -1; //= headchar(&rbuf);
    while (c != 'q') {
        c = cgetc();
        if ((c != 0)&&(c != -1)) printf(" x%02x x%02x\n", c, headchar(&rbuf));
        //c = headchar(&rbuf);
        waitvblank();
        vdp_update_key_state();
    }
}
