; Register Test for KLISP
; farting around with understanding 24bit addrs
;
; Author: Kristofer Younger
;
; Created: Fri 19 Apr 2025

.assume adl=1
.org $040000
    jp.l start

; MOS header
.align 64
.db "MOS",0,1

; ------------------------------
; Constants and memory layout (from main.asm)
; ------------------------------
NIL_ADDR:         equ     $050000   ; Address of NIL (special value)
T_ADDR:           equ     $050004   ; Address of T (boolean true)
SYMTAB_START:     equ     $05D000   ; Start of symbol table
ONE:              equ     $000001
   ; Address of 1 (integer)


; Atom flags and types
ATOM_FLAG:        equ     $008000     ; High bit indicates atom
SYM_FLAG:         equ     $004000     ; Symbol atom

; ------------------------------
; Global variables 
; ------------------------------
heap_ptr:
    .dw24 $051000                     ; HEAP_START
    .db 0

symtab_ptr:
    .dw24 SYMTAB_START                ; Current symbol table pointer
    .db 0

; Special symbols
t_symbol:         
    dw24 T_ADDR         ; T symbol address
nil_symbol:       
    DW24 NIL_ADDR       ; NIL symbol address

; ------------------------------
; Program entry point
; ------------------------------
start:
    ; Set up stack
    ;ld sp, $05F000                  ; STACK_START
    
               
    push af             ; store all the registers
    push bc
    push de
    push ix
    push iy

; ------------------
; This is our actual code

    ld hl, hello       ; address of string to use
    ld bc,0             ; length of string, or 0 if a delimiter is used
    ld a,0              ; A is the delimiter 
    rst.lil $18         ; Call the MOS API to send data to VDP 


    ; Initialize basic environment
    call init_test


    ; Exit the program
    pop iy              ; Pop all registers back from the stack
    pop ix
    pop de
    pop bc
    pop af

    ld hl, 0
    ret

; ------------------------------
; Test initialization
; ------------------------------
init_test:


    ; Initialize NIL as a special atom
    ld hl, NIL_ADDR
    ld bc, ATOM_FLAG | SYM_FLAG | 'N'
    ld (hl), bc                     ; CAR = ATOM_FLAG | SYM_FLAG | 'N'
    inc hl
    inc hl
    inc hl
    ld bc, 0
    ld (hl), bc                     ; CDR = 0
    
    ; Initialize T as a special atom
    ld hl, T_ADDR
    call print_hex_addr
    ld bc, ATOM_FLAG | SYM_FLAG | 'T'
    ld (hl), bc                     ; CAR = ATOM_FLAG | SYM_FLAG | 'T'
    inc hl
    inc hl
    inc hl
    ld bc, 0
    ld (hl), bc                     ; CDR = 0
    
    ret

hello:
    .db "RegTest\r\n",0 

INCLUDE "src/utils.asm"
