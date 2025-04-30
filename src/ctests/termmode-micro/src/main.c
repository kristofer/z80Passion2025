
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <agon/vdp_vdu.h>
#include <agon/vdp_key.h>

static volatile SYSVAR *sv;

int main( void )
{
    sv = vdp_vdu_init();
	if (vdp_key_init() == -1)
		return 1;

	vdp_terminal_mode();

    //int i = 0;
    while (true){
        puts("input> ");

        int ch = getchar();
        printf("Character entered: %c %04x\n", ch, ch);

        if ( ch == '\x7f' ) { exit(EXIT_SUCCESS); }
        //i++; if (i > 8) break;
    }


    vdp_terminal_mode();

    puts("Done");
    return 0;

}
