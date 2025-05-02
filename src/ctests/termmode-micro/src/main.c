
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>
//#include <mos_api.h>

static volatile SYSVAR *sv;

static KEY_EVENT prev_key_event = { 0 };
int _current_key = -1;

void key_event_handler( KEY_EVENT key_event ) {
	if ( key_event.key_data == prev_key_event.key_data ) {
	    _current_key = -1;
		return;
	} else {
	    prev_key_event = key_event;
		if (key_event.down != 0) {
	        _current_key = key_event.ascii;
			//printf("keh: %02x %02x ", key_event.mods,key_event.code);
		} else {
		_current_key = -1;
		};
	return;
	};
};

int getCharacter() {
    int ch = -1;
    while (ch==-1){
        vdp_update_key_state();
        ch = _current_key;
    }
    return ch;
}

void initVDP() {
//    sv = vdp_vdu_init();
    if (vdp_key_init() == -1) {
		puts("Failed to initialize keyboard");
        return;
    }
    vdp_set_key_event_handler(key_event_handler);
}

void cleanupVDP() {
}

int main( void ) {
    initVDP();

    int ch = -1;
    while (true){
        ch = getCharacter();
        if (ch != -1) printf("key pressed: %02x\n", ch);
        if ( ch == '\x7f' || ch == '\x1b' ) { break; }
    }

    cleanupVDP();

    puts("\nDone\n");
    return 0;
}
