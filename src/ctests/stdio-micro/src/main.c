
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
	puts("key_event_handler: new key ");
	prev_key_event = key_event;
	if (key_event.down != 0) {_current_key = key_event.ascii;}
		else {_current_key = 0;};
	return;
	};
};

char getKey()
{
    puts("getKey ");
    while (_current_key == 0);
    char key = _current_key;
    _current_key = 0;
    puts("end getKey ");
    return key;
}

int main( void )
{
    //vdp_terminal_mode();
    vdp_key_init();
    vdp_set_key_event_handler( key_event_handler );

    key_event_handler(prev_key_event);

    int i = 0;
    while (true){
        vdp_update_key_state();

        puts("input> ");
        int ch = getKey();
        printf("Character entered: %c %04x\n", ch, ch);
        puts("after! ");

        if ( ch == '\x7f' ) { exit(EXIT_SUCCESS); }

        if (ch == '\x1b') {
            puts("ESC pressed");
        } else {
            printf("Character entered: %c\n", ch);
        }
        i++; if (i > 8) break;
    }
    vdp_key_reset_interrupt();
    //vdp_terminal_mode();

    puts("Done");

    return 0;

}
