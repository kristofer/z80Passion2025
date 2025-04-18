;
; KLISP phase 0
;
; Author: Kristofer Younger
;
; Title:            KLISP Bootstrap
;
; Description:      A minimal LISP implementation for ez80 (16-bit data/24-bit addressing)
;                   with the fundamental operators: CONS, CAR, CDR, QUOTE, ATOM, EQ, 
;                   LAMBDA, LABEL and COND
;
; Created:          Fri 18 Apr 2025
;
; Modinfo:
.assume adl=1
.org $040000
    jp start

; MOS header
.align 64
.db "MOS",0,1

; ------------------------------
; Constants and memory layout
; ------------------------------

; Memory layout constants
NIL_ADDR:         equ     $050000   ; Address of NIL (special value)
T_ADDR:           equ     $050004   ; Address of T (boolean true)
HEAP_START:       equ     $051000   ; Start of the LISP heap
STACK_START:      equ     $05F000   ; Start of evaluation stack
ENV_START:        equ     $05E000   ; Start of environment space

; Atom flags (used in the CAR of cells)
ATOM_FLAG:        equ     $8000     ; High bit indicates atom
SYM_FLAG:         equ     $4000     ; Symbol atom

; ------------------------------
; Global variables 
; ------------------------------
heap_ptr:
    .dw HEAP_START                  ; Current heap pointer
    .db 0                           ; Zero for 24-bit addressing

stack_ptr:
    .dw STACK_START                 ; Current stack pointer 
    .db 0                           ; Zero for 24-bit addressing

env_ptr:
    .dw ENV_START                   ; Current environment pointer
    .db 0                           ; Zero for 24-bit addressing

; ------------------------------
; Program entry point
; ------------------------------
start:
    push af
    push bc
    push de
    push ix
    push iy
    
    ; Initialize the LISP system
    call init_lisp
    
    ; TODO: Add terminal I/O and REPL here
    
    ; For now, just run a simple test
    call run_tests
    
    ; Exit the program
    pop iy
    pop ix
    pop de
    pop bc
    pop af
    ld hl,0
    ret

; ------------------------------
; LISP System Initialization
; ------------------------------
init_lisp:
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
    ld bc, ATOM_FLAG | SYM_FLAG | 'T'
    ld (hl), bc                     ; CAR = ATOM_FLAG | SYM_FLAG | 'T'
    inc hl
    inc hl
    inc hl
    ld bc, 0
    ld (hl), bc                     ; CDR = 0
    
    ; Initialize heap pointer
    ld hl, HEAP_START
    ld (heap_ptr), hl
    
    ; Initialize stack pointer
    ld hl, STACK_START
    ld (stack_ptr), hl
    
    ; Initialize environment pointer
    ld hl, ENV_START
    ld (env_ptr), hl
    
    ret

; ------------------------------
; Core LISP Operations
; ------------------------------

; CONS: Create a new cell with CAR=bc, CDR=de
; Input: BC = CAR value, DE = CDR value
; Output: HL = address of new cell
cons:
    push bc                  ; Save CAR
    push de                  ; Save CDR
    
    ld hl, (heap_ptr)        ; Get current heap pointer
    
    pop de                   ; Get CDR
    ld (hl), de              ; Store CDR
    inc hl
    inc hl
    inc hl
    
    pop bc                   ; Get CAR
    ld (hl), bc              ; Store CAR
    
    ld hl, (heap_ptr)        ; Return the new cell address
    
    ; Update heap pointer (6 bytes per cell in ADL mode)
    ld bc, 6                 ; Cell size is 6 bytes (2x3-byte pointers)
    add hl, bc
    ld (heap_ptr), hl
    
    ret

; CAR: Get the CAR of a cell
; Input: HL = cell address
; Output: BC = CAR value
car:
    ld bc, 3                 ; CAR is 3 bytes after CDR
    add hl, bc
    ld bc, (hl)              ; Load CAR value
    ret

; CDR: Get the CDR of a cell
; Input: HL = cell address
; Output: BC = CDR value
cdr:
    ld bc, (hl)              ; Load CDR value
    ret

; ATOM: Is the value an atom?
; Input: HL = value
; Output: HL = T_ADDR if atom, NIL_ADDR if not
atom:
    push bc
    call car                 ; Get CAR
    ld a, b
    and $80                  ; Check if high bit is set (ATOM_FLAG)
    jr z, .not_atom
    pop bc
    ld hl, T_ADDR
    ret
.not_atom:
    pop bc
    ld hl, NIL_ADDR
    ret

; EQ: Are two values equal?
; Input: BC = value1, HL = value2
; Output: HL = T_ADDR if equal, NIL_ADDR if not
eq:
    ; Simple approach - just compare the addresses
    or a                     ; Clear carry
    sbc hl, bc               ; HL = HL - BC
    ld hl, NIL_ADDR          ; Assume not equal
    ret nz                   ; Return NIL if not equal
    ld hl, T_ADDR            ; Return T if equal
    ret

; CONS_SYMBOL: Create a new symbol atom with name
; Input: HL = pointer to null-terminated name
; Output: BC = address of new symbol
cons_symbol:
    push hl
    
    ; Get hash/value from name (simplified - just use first char)
    ld a, (hl)
    ld bc, ATOM_FLAG | SYM_FLAG
    or c                      ; Combine with flag
    ld c, a
    
    ; Create the atom
    push bc                   ; Save atom value
    ld bc, 0                  ; CDR = 0 
    call cons                 ; Create new cell
    pop bc                    ; Restore atom value
    ld (hl), bc               ; Set CAR value
    
    pop hl
    ret

; ------------------------------
; Basic evaluator
; ------------------------------

; EVAL: Evaluate a LISP expression
; Input: HL = expression to evaluate, DE = environment
; Output: BC = result
eval:
    ; First, check if expr is an atom
    push de                  ; Save environment
    call atom
    ld a, h
    or l
    jr z, .not_atom_tst
    
    ; It's an atom - we'd look it up in the environment
    ; For now, just return the atom itself
    pop de
    ret
    
.not_atom_tst:
    ; It's a list, get operator (first element)
    call car
    
    ; Dispatch based on operator
    ; This would be more complex in a real implementation
    ; We'd check for special forms (QUOTE, LAMBDA, etc)
    ; and otherwise apply functions
    
    ; For now, just return the original expression
    pop de
    ret

; ------------------------------
; TEST Code
; ------------------------------

run_tests:
    ; Test 1: Create NIL and T atoms
    ld hl, test1_msg
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    ; Test CONS
    ld bc, T_ADDR
    ld de, NIL_ADDR
    call cons
    
    ; At this point, HL should have the new cell addr
    ; We could examine it or do something with it
    ld bc, (hl)
    ld de, NIL_ADDR
    call cons

    ld a, '.'
    rst.lil $10

    ld hl, test1_done_msg
    ld bc, 0
    ld a, 0
    rst.lil $18

    ret

; ------------------------------
; Messages
; ------------------------------

test1_msg:
    .db "Running KLISP tests...",13,10,0
test1_done_msg:
    .db "tests done",13,10,0

; ------------------------------
; Symbol table
; ------------------------------

; We'll store some predefined symbols here
symbols:
    ; Built-in functions
    .db "CONS",0
    .db "CAR",0
    .db "CDR",0
    .db "ATOM",0
    .db "EQ",0
    .db "QUOTE",0
    .db "COND",0
    .db "LAMBDA",0
    .db "LABEL",0