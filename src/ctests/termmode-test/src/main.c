
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

static KEY_EVENT prev_key_event = { 0 };
char _current_key = 0;

void key_event_handler( KEY_EVENT key_event )
{
    puts("key_event_handler ");
	if ( key_event.key_data == prev_key_event.key_data ) return;
	else {
	prev_key_event = key_event;
	if (key_event.down != 0) {_current_key = key_event.ascii;}
		else {_current_key = 0;};
	printf("keh: %x %c ", key_event.mods,key_event.code);
	return;
	};
};

char getKey()
{
    puts("- ");
    // while (_current_key == 0);
    // char key = _current_key;
    char key = getchar();
    // _current_key = 0;
    puts("\n- ");
    return key;
}

void set_video_mode(uint8_t mode)
{
    putch(22); putch(mode);
}

static volatile SYSVAR *sv;

int main( void )
{
    sv = vdp_vdu_init();
	if (vdp_key_init() == -1)
		return 1;
	//vdp_terminal_mode();
	set_video_mode(3);
    vdp_set_key_event_handler( key_event_handler );

    key_event_handler(prev_key_event);

    //int i = 0;
    while (true){
        vdp_update_key_state();

        int ch = getKey();
        printf("Character entered: %c %04x\n", ch, ch);

        if ( ch == '\x7f' ) { exit(EXIT_SUCCESS); }

        if (ch == '\x1b') {
            puts("ESC pressed");
        } else {
            printf("ch: %c\n", ch);
        }
        //i++; if (i > 8) break;
    }
    vdp_key_reset_interrupt();
    //vdp_terminal_mode();

    // This happens when the program has quit
//    vdp_set_screen_mode(0);
    vdp_clear_screen();
    vdp_logical_scr_dims( true );
    vdp_cursor_enable( true );

    puts("Done");
    set_video_mode(0);
    return 0;

}
