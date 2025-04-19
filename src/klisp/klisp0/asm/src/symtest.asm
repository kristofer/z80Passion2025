; Symbol Table Test for KLISP
; Tests the intern_symbol functionality
;
; Author: Kristofer Younger
;
; Created: Fri 18 Apr 2025

.assume adl=1
.org $040000
    jp.lil start

; MOS header
.align 64
.db "MOS",0,1

; ------------------------------
; Constants and memory layout (from main.asm)
; ------------------------------
NIL_ADDR:         equ     $050000   ; Address of NIL (special value)
T_ADDR:           equ     $050004   ; Address of T (boolean true)
SYMTAB_START:     equ     $05D000   ; Start of symbol table

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
    .dw24 T_ADDR         ; T symbol address
nil_symbol:
    .dw24 NIL_ADDR       ; NIL symbol address

; ------------------------------
; Program entry point
; ------------------------------
start:
    ; Set up stack
    ld.l sp, $05F000                  ; STACK_START
    
    ; Initialize basic environment
    call init_test
    
    ; Run tests
    call symbol_table_tests
    
    ; Exit the program
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
    ld bc, ATOM_FLAG | SYM_FLAG | 'T'
    ld (hl), bc                     ; CAR = ATOM_FLAG | SYM_FLAG | 'T'
    inc hl
    inc hl
    inc hl
    ld bc, 0
    ld (hl), bc                     ; CDR = 0
    
    ret

; ------------------------------
; Symbol table tests
; ------------------------------
symbol_table_tests:
    ; Display test header
    ld hl, test_header
    call print_string
    
    ; Test 1: Basic symbol creation
    call test_1_basic_creation
    
    ; Test 2: Symbol retrieval
    call test_2_symbol_retrieval
    
    ; Test 3: Multiple symbols
    call test_3_multiple_symbols
    
    ret

; ------------------------------
; Test 1: Basic symbol creation
; ------------------------------
test_1_basic_creation:
    ld hl, test1_header
    call print_string
    
    ; Create a new symbol "HELLO"
    ld hl, sym_hello
    call intern_symbol
    
    ; Save the symbol address
    ld (test1_sym_addr), hl
    
    ; Check if the symbol was created (not NIL)
    ld bc, NIL_ADDR
    or a                      ; Clear carry
    sbc hl, bc
    
    jr z, .test1_failed
    
    ; Print success message
    ld hl, test1_success
    call print_string
    
    ; Print the symbol address
    ld hl, test1_addr_msg
    call print_string
    
    ld hl, (test1_sym_addr)
    call print_hex_addr
    
    ld hl, newline
    call print_string
    
    ret
    
.test1_failed:
    ld hl, test1_failed_msg
    call print_string
    ret

; ------------------------------
; Test 2: Symbol retrieval
; ------------------------------
test_2_symbol_retrieval:
    ld hl, test2_header
    call print_string
    
    ; Try to get the symbol "HELLO" again
    ld hl, sym_hello
    call intern_symbol
    
    ; Save the retrieved address
    ld (test2_sym_addr), hl
    
    ; Compare with the address from test 1
    ld bc, (test1_sym_addr)
    or a                      ; Clear carry
    sbc hl, bc
    
    jr nz, .test2_failed
    
    ; Print success message
    ld hl, test2_success
    call print_string
    
    ret
    
.test2_failed:
    ld hl, test2_failed_msg
    call print_string
    
    ; Print expected vs actual
    ld hl, test2_expected
    call print_string
    
    ld hl, (test1_sym_addr)
    call print_hex_addr
    
    ld hl, test2_actual
    call print_string
    
    ld hl, (test2_sym_addr)
    call print_hex_addr
    
    ld hl, newline
    call print_string
    
    ret

; ------------------------------
; Test 3: Multiple symbols
; ------------------------------
test_3_multiple_symbols:
    ld hl, test3_header
    call print_string
    
    ; Create two more symbols
    ld hl, sym_world
    call intern_symbol
    ld (test3_sym1_addr), hl
    
    ld hl, sym_lisp
    call intern_symbol
    ld (test3_sym2_addr), hl
    
    ; Retrieve all three symbols and verify they're distinct
    ld hl, sym_hello
    call intern_symbol
    ld bc, (test1_sym_addr)
    or a                      ; Clear carry
    sbc hl, bc
    
    jr nz, .test3_failed
    
    ld hl, sym_world
    call intern_symbol
    ld bc, (test3_sym1_addr)
    or a                      ; Clear carry
    sbc hl, bc
    
    jr nz, .test3_failed
    
    ld hl, sym_lisp
    call intern_symbol
    ld bc, (test3_sym2_addr)
    or a                      ; Clear carry
    sbc hl, bc
    
    jr nz, .test3_failed
    
    ; Success! All symbols were correctly retrieved
    ld hl, test3_success
    call print_string
    
    ; Display the symbol table info
    ld hl, test3_symtab_info
    call print_string
    
    ld hl, (symtab_ptr)
    ld bc, SYMTAB_START
    or a                      ; Clear carry
    sbc hl, bc
    push hl                   ; Save byte count
    
    ; Divide by 3 to get entry count
    ld de, 3
    call div16
    
    ld a, l                   ; Get entry count (should be 3)
    add '0'                   ; Convert to ASCII
    ld (test3_count), a
    
    ld hl, test3_count_msg
    call print_string
    
    ret
    
.test3_failed:
    ld hl, test3_failed_msg
    call print_string
    ret

; ------------------------------
; COMP_SYMBOL: Compare two null-terminated strings
; Purpose: Compares two null-terminated strings character by character.
; Input: HL = pointer to the first string, BC = pointer to the second string
; Output: HL = T_ADDR if the strings are equal, NIL_ADDR if they are not equal
; ------------------------------
comp_symbol:
    push de
    
.loop:
    call print_hex_addr
    ld a, (hl)          ; Get character from first string
    ld d, a             ; Save in D
    ld a, (bc)          ; Get character from second string

    push hl
    push bc
    pop hl
    call print_hex_addr
    pop hl


    cp d                ; Compare characters
    jr nz, .not_equal   ; If not equal, return false
    
    ; Check if we reached the end (both strings null terminated)
    or a                ; Test if character is 0
    jr z, .equal        ; If zero, we're done and strings match
    
    ; Move to next character in both strings
    inc hl
    inc bc
    jr .loop
    
.not_equal:
    ld hl, NIL_ADDR     ; Return NIL (false)
    pop de
    ret
    
.equal:
    ld hl, T_ADDR       ; Return T (true)
    pop de
    ret

; ------------------------------
; Utility functions
; ------------------------------

; PRINT_STRING: Print a null-terminated string
; Input: HL = pointer to string
; Output: None
print_string:
    push af
    push bc
    push hl
    
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    pop hl
    pop bc
    pop af
    ret

; PRINT_HEX_ADDR: Print a 24-bit address in hexadecimal
; Input: HL = address to print
; Output: None
print_hex_addr:
    push af
    push bc
    push de
    push hl
    
    ; Convert to ASCII hex and store in buffer
    ld de, hex_buffer
    
    ; High byte
    ld a, h
    call .to_hex
    
    ; Middle byte
    ld a, l
    call .to_hex
    
    ; Add null terminator
    xor a
    ld (de), a
    
    ; Print the hex string
    ld hl, hex_buffer
    call print_string
    
    pop hl
    pop de
    pop bc
    pop af
    ret
    
.to_hex:
    push af
    srl a
    srl a
    srl a
    srl a
    call .nibble
    ld (de), a
    inc de
    
    pop af
    and $0F
    call .nibble
    ld (de), a
    inc de
    ret
    
.nibble:
    cp 10
    jr c, .digit
    add 'A' - 10
    ret
.digit:
    add '0'
    ret

; DIV16: 16-bit division
; Input: HL = numerator, DE = denominator
; Output: HL = HL / DE, BC = HL % DE
div16:
    ld bc, 0            ; Remainder
    ld a, 16            ; 16 bits
    
.loop_div:
    ; Shift HL left, MSB into carry
    add hl, hl
    
    ; Shift carry into BC
    rl c
    rl b
    
    ; Compare BC with DE
    push hl
    ld h, b
    ld l, c
    or a               ; Clear carry
    sbc hl, de
    jr c, .no_sub
    
    ; BC >= DE, keep result and set bit 0 of HL
    ld b, h
    ld c, l
    pop hl
    set 0, l
    jr .next
    
.no_sub:
    pop hl
    
.next:
    dec a
    jr nz, .loop_div
    
    ret

; ------------------------------
; Data section
; ------------------------------

; Test variables
test1_sym_addr:    .dw 0, 0     ; 24-bit address storage
test2_sym_addr:    .dw 0, 0
test3_sym1_addr:   .dw 0, 0
test3_sym2_addr:   .dw 0, 0

; Test symbols
sym_hello:         .db "HELLO", 0
sym_world:         .db "WORLD", 0
sym_lisp:          .db "LISP", 0

; Output buffer
hex_buffer:        .ds 5        ; Room for 4 hex digits + null terminator
test3_count:       .db "0", 0

; Test messages
test_header:       .db "KLISP Symbol Table Tests", 13, 10, 13, 10, 0

test1_header:      .db "Test 1: Basic Symbol Creation", 13, 10, 0
test1_success:     .db "  PASS: Successfully created symbol 'HELLO'", 13, 10, 0
test1_failed_msg:  .db "  FAIL: Could not create symbol", 13, 10, 0
test1_addr_msg:    .db "  Symbol address: $", 0

test2_header:      .db "Test 2: Symbol Retrieval", 13, 10, 0
test2_success:     .db "  PASS: Successfully retrieved the same symbol address", 13, 10, 0
test2_failed_msg:  .db "  FAIL: Got different address for same symbol", 13, 10, 0
test2_expected:    .db "  Expected: $", 0
test2_actual:      .db ", Got: $", 0

test3_header:      .db "Test 3: Multiple Symbols", 13, 10, 0
test3_success:     .db "  PASS: Successfully created and retrieved multiple symbols", 13, 10, 0
test3_failed_msg:  .db "  FAIL: Symbol retrieval did not match creation", 13, 10, 0
test3_symtab_info: .db "  Symbol table information:", 13, 10, 0
test3_count_msg:   .db "  Number of symbols in table: ", 0

newline:           .db 13, 10, 0

; ------------------------------
; Include the INTERN_SYMBOL function from main code
; ------------------------------

; INTERN_SYMBOL: Look up or create a symbol
; Input: HL = pointer to null-terminated name
; Output: HL = address of symbol
intern_symbol:
    push bc
    push de
    
    ; Save the name pointer
    push hl
    
    ; First check if this symbol already exists in the symbol table
    ld de, SYMTAB_START
    
.check_loop:
    ; Check if we've reached the end of the symbol table
    ld bc, (symtab_ptr)
    or a                      ; Clear carry
    push hl                   ; Save name pointer
    sbc hl, bc
    jr z, .symbol_not_found   ; If at end of symtab, symbol doesn't exist
    pop hl                    ; Restore name pointer
    
    ; Get current symbol from table
    push hl                   ; Save name pointer
    
    ; Get symbol address from table (LD HL, (DE) not supported)
    ;push (DE)
    ;pop HL                 ; HL = symbol from table
    ld a, (de)
    ld l, a
    inc de
    ld a, (de)
    ld h, a
    dec de                   ; Restore DE
    
    ; Compare name with this symbol
    ld.lil bc, (hl)                 ; BC = symbol from table
    pop hl                    ; HL = name to find
    
    push de                   ; Save table position
    push hl                   ; Save name pointer
    call comp_symbol          ; Compare strings - returns T_ADDR if equal
    
    ; Check result of comparison
    ld bc, T_ADDR
    or a                      ; Clear carry
    sbc hl, bc
    pop hl                    ; Restore name pointer
    pop de                    ; Restore table position
    
    jr z, .symbol_found       ; If equal, return this symbol
    
    ; Not a match, move to next entry
    inc de
    inc de
    inc de                    ; Each entry is 3 bytes (24-bit address)
    jr .check_loop
    
.symbol_not_found:
    ; Need to release the extra stack item we pushed
    pop hl                    ; Clear extra stack item
    
    ; Symbol not found, create a new one
    pop hl                    ; Restore name pointer
    
    ; Get hash/value from name (simplified - just use first char for now)
    ld a, (hl)
    ld bc, ATOM_FLAG | SYM_FLAG
    or c                      ; Combine with flag
    ld c, a
    
    ; Create the atom
    push bc                   ; Save atom value
    push hl                   ; Save name pointer
    
    ld bc, 0                  ; CDR = 0 
    ld de, 0
    call cons                 ; Create new cell
    
    pop ix                    ; Get name pointer to IX
    pop bc                    ; Restore atom value
    
    ; Store the atom value in the CAR
    push hl                   ; Save cell address
    ld de, 3                  ; CAR offset
    add hl, de
    ld (hl), bc               ; Set CAR value
    pop hl                    ; Restore cell address
    
    ; Add to symbol table
    push hl                   ; Save symbol address
    ld bc, (hl)
    ld hl, (symtab_ptr)
    ld (hl), bc               ; Store symbol address in symtab
    
    ; Update symtab pointer
    ld bc, 3                  ; Each entry is 3 bytes
    add hl, bc
    ld (symtab_ptr), hl
    
    pop hl                    ; Restore symbol address - this is our return value
    pop de
    pop bc
    ret
    
.symbol_found:
    ; We found the symbol, return its address
    pop hl                    ; Clear name pointer from stack
    
    ; Get the symbol address (already in DE pointing to symtab entry)
    ld a, (de)
    ld l, a
    inc de
    ld a, (de)
    ld h, a
    ; (third byte handling if needed for 24-bit addressing)
    
    pop de
    pop bc
    ret

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

; End of file