//Agon version
// Modified from https://github.com/sijnstra/agdev-projects/blob/main/simple/src/simple.c
//
#include "header.h"

int main()
{
    bool exitflag = false;
    char ch = 0;

//    vdp_mode( 2 );
//    vdp_clear_screen();
//    vdp_logical_scr_dims( false );
//    vdp_cursor_enable( false );
    vdp_terminal_mode();

    puts("\nKeytest v1 \n ");

    while (!exitflag)
    {
        ch = getchar();//wgetch(); //getsysvar_cheydown();
        if ( ch == '\x03' ) break;
        if ( ch == '\x7f' ) { exitflag = true; exit(EXIT_SUCCESS); }
        switch (ch){
        case 0x7f:
            exitflag = true; break;
        default:
        printf(" 0x%02x %c",ch, ch); break;
        }

    }

    vdp_terminal_mode();
//    vdp_cursor_enable( true );

    return 0;
}
