; KLISP phase 0
;
; Memory representation for LISP cells
; Each cell is 4 bytes:
;   2 bytes: CAR pointer (or atom value)
;   2 bytes: CDR pointer
; Atoms are represented with the high bit set in the CAR

; Constants
NIL_ADDR        EQU     0000h   ; NIL is at address 0
T_ADDR          EQU     0004h   ; T is at address 4
HEAP_START      EQU     1000h   ; Start of free memory

; Special atom flag
ATOM_FLAG       EQU     8000h   ; High bit indicates atom

; Initialize LISP environment
init_lisp:
    ; Setup NIL as an atom
    ld      hl, NIL_ADDR
    ld      de, ATOM_FLAG | 'NIL'
    ld      (hl), de          ; CAR = ATOM_FLAG | 'NIL'
    inc     hl
    inc     hl
    ld      de, 0
    ld      (hl), de          ; CDR = 0
    
    ; Setup T as an atom
    ld      hl, T_ADDR
    ld      de, ATOM_FLAG | 'T'
    ld      (hl), de          ; CAR = ATOM_FLAG | 'T'
    inc     hl
    inc     hl
    ld      de, 0
    ld      (hl), de          ; CDR = 0
    
    ; Initialize heap pointer
    ld      hl, HEAP_START
    ld      (heap_ptr), hl
    
    ret
    