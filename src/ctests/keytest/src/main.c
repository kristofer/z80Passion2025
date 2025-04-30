//Agon version
// Modified from https://github.com/sijnstra/agdev-projects/blob/main/simple/src/simple.c
//
#include "header.h"
#include <stdio.h>

int main()
{
    bool exit = false;
    uint8_t vk;

    // Создание и генерация карты
    vdp_mode( 18 );
    vdp_clear_screen();
    vdp_logical_scr_dims( false );
    vdp_cursor_enable( false );

    printf("Keytest v1");

    while (!exit)
    {
        vk = getsysvar_vkeydown();
        switch (vk){
        case 0x7d:
            exit = true; break;
        case 0x9c:
            printf("0x9C"); break;
            case 0x9a:
            printf("0x9A"); break;
        case 0x8f:
            break;
        default:
        printf("0x%x",vk); break;
        }

    }

    vdp_cursor_enable( true );

    return 0;
}
