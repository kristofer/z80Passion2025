;
; KLISP phase 0-3
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
SYMTAB_START:     equ     $05D000   ; Start of symbol table
INPUT_BUFFER:     equ     $05C000   ; Input buffer (1K)
OUTPUT_BUFFER:    equ     $05B000   ; Output buffer (1K)

; Maximum buffer sizes
INPUT_BUFFER_SIZE:  equ   1024
OUTPUT_BUFFER_SIZE: equ   1024

; Atom flags and types (used in the CAR of cells)
ATOM_FLAG:        equ     $8000     ; High bit indicates atom
SYM_FLAG:         equ     $4000     ; Symbol atom
NUM_FLAG:         equ     $2000     ; Number atom
STR_FLAG:         equ     $1000     ; String atom

; Special form tags for the evaluator
QUOTE_TAG:        equ     1
LAMBDA_TAG:       equ     2
COND_TAG:         equ     3
LABEL_TAG:        equ     4

; Character constants
CHAR_SPACE:       equ     ' '
CHAR_TAB:         equ     9
CHAR_NEWLINE:     equ     10
CHAR_RETURN:      equ     13
CHAR_LPAREN:      equ     '('
CHAR_RPAREN:      equ     ')'
CHAR_QUOTE:       equ     '\''
CHAR_PERIOD:      equ     '.'

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

symtab_ptr:
    .dw SYMTAB_START                ; Current symbol table pointer
    .db 0                           ; Zero for 24-bit addressing

input_ptr:
    .dw 0                           ; Current input buffer position
    .db 0

output_ptr:
    .dw OUTPUT_BUFFER               ; Current output buffer position
    .db 0

; Special symbols
quote_symbol:     .dw 0              ; QUOTE symbol address
lambda_symbol:    .dw 0              ; LAMBDA symbol address
cond_symbol:      .dw 0              ; COND symbol address
label_symbol:     .dw 0              ; LABEL symbol address
t_symbol:         .dw T_ADDR         ; T symbol address
nil_symbol:       .dw NIL_ADDR       ; NIL symbol address

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
    
    ; Display welcome message
    ld hl, welcome_msg
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    ; Enter the REPL (Read-Eval-Print Loop)
    call repl
    
    ; Exit the program
    ld hl, exit_msg
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    pop iy
    pop ix
    pop de
    pop bc
    pop af
    ld hl, 0
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
    
    ; Initialize pointers
    ld hl, HEAP_START
    ld (heap_ptr), hl
    
    ld hl, STACK_START
    ld (stack_ptr), hl
    
    ld hl, ENV_START
    ld (env_ptr), hl
    
    ld hl, SYMTAB_START
    ld (symtab_ptr), hl
    
    ld hl, OUTPUT_BUFFER
    ld (output_ptr), hl
    
    ; Create special symbols
    ld hl, sym_quote
    call intern_symbol
    ld (quote_symbol), hl
    
    ld hl, sym_lambda
    call intern_symbol
    ld (lambda_symbol), hl
    
    ld hl, sym_cond
    call intern_symbol
    ld (cond_symbol), hl
    
    ld hl, sym_label
    call intern_symbol
    ld (label_symbol), hl
    
    ; Initialize initial environment with built-in functions
    call init_environment
    
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

;; COMP_SYMBOL: Compare two null-terminated strings
; Input: HL = pointer to first string, BC = pointer to second string
; Output: HL = T_ADDR if equal, NIL_ADDR if not equal
comp_symbol:
    push de
    
.loop:
    ld a, (hl)          ; Get character from first string
    ld d, a             ; Save in D
    ld a, (bc)          ; Get character from second string
    
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
    ld bc, (symtab_ptr)
    or a                      ; Clear carry
    sbc hl, bc
    add hl, bc                ; Restore HL
    jr z, .end_check          ; If at end of symtab, symbol doesn't exist
    
    ; Compare symbol name
    push hl                   ; Save symtab pointer
    ld bc, (hl)               ; BC = current symtab entry
    pop hl                    ; HL = string to find
    
    ; TODO: Compare the strings
    ; If match found, return the symbol address
    call comp_symbol
    ld bc, NIL_ADDR
    call eq
    jr z, .strings_not_equal

    ld hl, (de)             ; Next symtab entry
    inc de
    jr .check_loop
    
.end_check:
    ; Symbol not found, create a new one
    pop hl                    ; Restore name pointer
    
    ; Get hash/value from name (simplified - just use first char for now)
    ld a, (hl)
    ld bc, ATOM_FLAG | SYM_FLAG
    or c                      ; Combine with flag
    ld c, a
    
    ; Create the atom
    push bc                   ; Save atom value
    ld bc, 0                  ; CDR = 0 
    ld de, 0
    call cons                 ; Create new cell
    pop bc                    ; Restore atom value
    
    ; Store the atom value in the CAR
    push hl                   ; Save cell address
    ld de, 3                  ; CAR offset
    add hl, de
    ld (hl), bc               ; Set CAR value
    pop hl                    ; Restore cell address
    
    ; Add to symbol table
    push hl                   ; Save symbol address
    ld bc, hl
    ld hl, (symtab_ptr)
    ld (hl), bc               ; Store symbol address in symtab
    
    ; Update symtab pointer
    ld bc, 3                  ; Each entry is 3 bytes
    add hl, bc
    ld (symtab_ptr), hl
    
    pop hl                    ; Restore symbol address
    pop de
    pop bc
    ret

; ------------------------------
; Reader - Parse LISP expressions from text
; ------------------------------

; READ: Parse a LISP expression from the input buffer
; Input: None (uses input_ptr)
; Output: HL = parsed expression
read:
    push bc
    push de
    
    ; Skip whitespace
    call skip_whitespace
    
    ; Check for EOF
    ld a, (hl)
    or a
    jr z, .read_eof
    
    ; Check first character
    cp CHAR_LPAREN        ; '('
    jr z, .read_list
    
    cp CHAR_QUOTE         ; '\''
    jr z, .read_quote
    
    ; Otherwise, read an atom
    call read_atom
    pop de
    pop bc
    ret
    
.read_eof:
    ; Return NIL for EOF
    ld hl, NIL_ADDR
    pop de
    pop bc
    ret
    
.read_list:
    ; Skip the opening parenthesis
    inc hl
    ld (input_ptr), hl
    
    ; Skip whitespace
    call skip_whitespace
    
    ; Check for empty list
    ld a, (hl)
    cp CHAR_RPAREN        ; ')'
    jr z, .empty_list
    
    ; Read first element
    call read
    
    ; Save first element and create a list
    push hl               ; Save first element
    
    ; Read the rest of the list
    call read_list_tail
    
    ; Now DE = rest of list
    pop bc                ; BC = first element
    
    ; Cons them together
    call cons
    
    pop de
    pop bc
    ret
    
.empty_list:
    ; Skip the closing parenthesis
    inc hl
    ld (input_ptr), hl
    
    ; Return NIL
    ld hl, NIL_ADDR
    pop de
    pop bc
    ret
    
.read_quote:
    ; Skip the quote character
    inc hl
    ld (input_ptr), hl
    
    ; Read the quoted expression
    call read
    
    ; Create (QUOTE expr)
    push hl               ; Save expr
    
    ; Create (expr)
    ld bc, hl
    ld hl, NIL_ADDR
    call cons
    
    ; HL now contains (expr)
    push hl
    
    ; Get the QUOTE symbol
    ld hl, (quote_symbol)
    pop de                ; DE = (expr)
    
    ; Create (QUOTE expr)
    ld bc, hl
    ld hl, de
    call cons
    
    pop de
    pop bc
    ret

; READ_LIST_TAIL: Read the rest of a list
; Input: None (uses input_ptr)
; Output: HL = parsed list tail
read_list_tail:
    push bc
    push de
    
    ; Skip whitespace
    call skip_whitespace
    
    ; Check for end of list
    ld a, (hl)
    cp CHAR_RPAREN        ; ')'
    jr z, .end_list
    
    cp CHAR_PERIOD        ; '.'
    jr z, .dotted_list
    
    ; Read next element
    call read
    
    ; Save element
    push hl               ; Save element
    
    ; Read the rest of the list
    call read_list_tail
    
    ; Now HL = rest of list
    pop bc                ; BC = current element
    
    ; Cons them together
    ld de, hl
    call cons
    
    pop de
    pop bc
    ret
    
.end_list:
    ; Skip the closing parenthesis
    inc hl
    ld (input_ptr), hl
    
    ; Return NIL
    ld hl, NIL_ADDR
    pop de
    pop bc
    ret
    
.dotted_list:
    ; Skip the dot
    inc hl
    ld (input_ptr), hl
    
    ; Skip whitespace
    call skip_whitespace
    
    ; Read the final element
    call read
    
    ; Skip whitespace
    call skip_whitespace
    
    ; Expect a closing parenthesis
    ld a, (hl)
    cp CHAR_RPAREN        ; ')'
    jr nz, .syntax_error
    
    ; Skip the closing parenthesis
    inc hl
    ld (input_ptr), hl
    
    pop de
    pop bc
    ret
    
.syntax_error:
    ; Return NIL for syntax error (should add better error handling)
    ld hl, NIL_ADDR
    pop de
    pop bc
    ret

; READ_ATOM: Read an atom (symbol or number)
; Input: HL = input pointer
; Output: HL = parsed atom
read_atom:
    push bc
    push de
    
    ; Save start of token
    push hl
    
    ; Find end of token
    ld bc, 0               ; BC will count length
    
.token_loop:
    ld a, (hl)
    
    ; Check for end of token
    or a                    ; Check for null
    jr z, .end_token
    
    cp CHAR_SPACE
    jr z, .end_token
    
    cp CHAR_TAB
    jr z, .end_token
    
    cp CHAR_NEWLINE
    jr z, .end_token
    
    cp CHAR_RETURN
    jr z, .end_token
    
    cp CHAR_LPAREN
    jr z, .end_token
    
    cp CHAR_RPAREN
    jr z, .end_token
    
    ; Token continues
    inc hl
    inc bc
    jr .token_loop
    
.end_token:
    ; Store the new input position
    ld (input_ptr), hl
    
    ; Restore start of token
    pop hl
    
    ; Check if it's a number
    ld a, (hl)
    cp '0'
    jr c, .not_number
    cp '9'+1
    jr nc, .not_number
    
    ; It's a number, parse it
    call parse_number
    pop de
    pop bc
    ret
    
.not_number:
    ; It's a symbol, create or find it
    call intern_symbol
    pop de
    pop bc
    ret

; PARSE_NUMBER: Parse a number from text
; Input: HL = input pointer
; Output: HL = number atom
parse_number:
    push bc
    push de
    
    ; Parse the digits (very simple version)
    ld de, 0                ; DE will accumulate the number
    
.digit_loop:
    ld a, (hl)
    
    ; Check for end of number
    cp '0'
    jr c, .end_number
    cp '9'+1
    jr nc, .end_number
    
    ; Convert digit
    sub '0'
    
    ; Multiply current value by 10
    push af
    ld a, e
    ld c, a
    ld a, d
    ld b, a                ; BC = DE
    
    ld h, 0
    ld l, 10
    call mul16             ; HL = BC * 10
    
    ld d, h
    ld e, l                ; DE = HL
    
    pop af
    
    ; Add current digit
    ld c, a
    ld b, 0
    ex de, hl
    add hl, bc
    ex de, hl              ; DE = DE + digit
    
    inc hl
    jr .digit_loop
    
.end_number:
    ; Create number atom
    ld bc, ATOM_FLAG | NUM_FLAG
    or b
    ld b, a
    or c
    ld c, a
    
    ; Add the value
    ld a, e
    or c
    ld c, a
    ld a, d
    or b
    ld b, a                ; BC = flags | value
    
    ; Create the atom
    ld de, 0
    call cons
    
    ; Set the atom type/value
    push hl
    ld de, 3               ; CAR offset
    add hl, de
    ld (hl), bc            ; Set CAR value
    pop hl
    
    pop de
    pop bc
    ret

; SKIP_WHITESPACE: Skip whitespace in the input buffer
; Input: None (uses input_ptr)
; Output: HL = new input position
skip_whitespace:
    ld hl, (input_ptr)
    
.loop:
    ld a, (hl)
    
    ; Check for whitespace
    cp CHAR_SPACE
    jr z, .skip
    
    cp CHAR_TAB
    jr z, .skip
    
    cp CHAR_NEWLINE
    jr z, .skip
    
    cp CHAR_RETURN
    jr z, .skip
    
    ; Not whitespace, return
    ret
    
.skip:
    inc hl
    jr .loop

; MUL16: 16-bit multiplication
; Input: BC, HL = 16-bit values to multiply
; Output: HL = BC * HL (lower 16 bits)
mul16:
    push bc
    push de
    
    ld d, 0
    ld e, 0
    
    ; Simple shift and add multiplication
    ld a, 16               ; 16 bits
    
.loop:
    add hl, hl             ; Shift HL left
    jr nc, .no_add
    
    ; Add BC to DE
    ex de, hl
    add hl, bc
    ex de, hl
    
.no_add:
    dec a
    jr nz, .loop
    
    ; Result in DE
    ex de, hl
    
    pop de
    pop bc
    ret

; ------------------------------
; Printer - Convert LISP structures to text
; ------------------------------

; PRINT: Convert a LISP expression to text
; Input: BC = expression to print
; Output: None (writes to output buffer)
print:
    push hl
    push de
    push bc
    
    ; Clear output buffer
    ld hl, OUTPUT_BUFFER
    ld (output_ptr), hl
    
    ; Call recursive print function
    call print_expr
    
    ; Null-terminate the output buffer
    ld hl, (output_ptr)
    ld (hl), 0
    
    ; Display the output buffer
    ld hl, OUTPUT_BUFFER
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    pop bc
    pop de
    pop hl
    ret

; PRINT_EXPR: Recursive function to print an expression
; Input: BC = expression to print
; Output: None (writes to output buffer)
print_expr:
    push hl
    push de
    push bc
    
    ; Check if it's NIL
    ld a, b
    cp NIL_ADDR >> 16
    jr nz, .not_nil
    
    ld a, c
    cp NIL_ADDR & $FFFF
    jr nz, .not_nil
    
    ; It's NIL, print "NIL"
    ld hl, str_nil
    call print_string
    
    pop bc
    pop de
    pop hl
    ret
    
.not_nil:
    ; Check if it's an atom
    ld hl, bc
    call atom
    ld a, h
    or l
    jr z, .not_atom
    
    ; It's an atom, print its value
    call print_atom
    
    pop bc
    pop de
    pop hl
    ret
    
.not_atom:
    ; It's a list, print as (a b c)
    ld a, CHAR_LPAREN
    call print_char
    
    ; Print the first element
    ld hl, bc
    call car
    call print_expr
    
    ; Print the rest of the list
    ld hl, bc
    call cdr
    ld bc, hl
    call print_list_tail
    
    ; Close the list
    ld a, CHAR_RPAREN
    call print_char
    
    pop bc
    pop de
    pop hl
    ret

; PRINT_LIST_TAIL: Print the rest of a list
; Input: BC = list tail to print
; Output: None (writes to output buffer)
print_list_tail:
    push hl
    push de
    push bc
    
    ; Check if it's NIL (end of list)
    ld a, b
    cp NIL_ADDR >> 16
    jr nz, .not_nil
    
    ld a, c
    cp NIL_ADDR & $FFFF
    jr nz, .not_nil
    
    ; End of list, nothing more to print
    pop bc
    pop de
    pop hl
    ret
    
.not_nil:
    ; Check if it's a proper list
    ld hl, bc
    call atom
    ld a, h
    or l
    jr z, .proper_list
    
    ; It's a dotted list, print as ". atom"
    ld a, CHAR_SPACE
    call print_char
    
    ld a, CHAR_PERIOD
    call print_char
    
    ld a, CHAR_SPACE
    call print_char
    
    ; Print the final atom
    ld bc, hl
    call print_expr
    
    pop bc
    pop de
    pop hl
    ret
    
.proper_list:
    ; Print a space separator
    ld a, CHAR_SPACE
    call print_char
    
    ; Print the next element
    ld hl, bc
    call car
    call print_expr
    
    ; Print the rest of the list
    ld hl, bc
    call cdr
    ld bc, hl
    call print_list_tail
    
    pop bc
    pop de
    pop hl
    ret

; PRINT_ATOM: Print an atom
; Input: BC = atom to print
; Output: None (writes to output buffer)
print_atom:
    push hl
    push de
    push bc
    
    ; Check atom type
    ld hl, bc
    ld bc, 3              ; CAR offset
    add hl, bc
    ld bc, (hl)           ; Get CAR value with type flags
    
    ; Check if it's a number
    ld a, b
    and NUM_FLAG >> 8
    jr nz, .number_atom
    
    ; It's a symbol, print its name
    ; For now, just print the raw value (simplified)
    ld a, b
    and $3F               ; Remove flags
    call print_char
    
    pop bc
    pop de
    pop hl
    ret
    
.number_atom:
    ; Extract the number value
    ld a, b
    and $1F               ; Remove flags
    ld b, a
    
    ; Print the number
    call print_number
    
    pop bc
    pop de
    pop hl
    ret

; PRINT_NUMBER: Print a number
; Input: BC = number to print
; Output: None (writes to output buffer)
print_number:
    push hl
    push de
    push bc
    
    ; Check if zero
    ld a, b
    or c
    jr nz, .not_zero
    
    ; Print '0'
    ld a, '0'
    call print_char
    
    pop bc
    pop de
    pop hl
    ret
    
.not_zero:
    ; Convert to decimal and print
    ; For simplicity, we'll just handle small numbers for now
    
    ; Print the number as decimal
    ld hl, 0              ; Digit counter
    ld de, 10000          ; Start with 10000s place
    
.digit_loop:
    push hl               ; Save digit counter
    
    ; Divide BC by DE
    call div16            ; HL = BC / DE, BC = BC % DE
    
    ; Check if we've printed a digit yet
    pop de                ; DE = digit counter
    
    ; If HL (quotient) is zero and we haven't printed a digit yet, skip
    ld a, h
    or l
    jr nz, .print_digit
    
    ld a, d
    or e
    jr z, .next_digit
    
.print_digit:
    ; Print the digit
    ld a, l
    add a, '0'
    call print_char
    
    ; Increment digit counter
    inc de
    
.next_digit:
    push de               ; Save digit counter
    
    ; Move to next digit place
    ld hl, de
    ld de, 10
    call div16            ; HL = DE / 10
    
    ; If DE is zero, we're done
    ld a, h
    or l
    jr z, .done
    
    ex de, hl             ; DE = next divisor
    
    pop hl                ; HL = digit counter
    jr .digit_loop
    
.done:
    pop hl                ; Clean up stack
    
    pop bc
    pop de
    pop hl
    ret

; DIV16: 16-bit division
; Input: BC = numerator, DE = denominator
; Output: HL = BC / DE, BC = BC % DE
div16:
    push de
    
    ld hl, 0              ; Initialize quotient
    
    ; Check for division by zero
    ld a, d
    or e
    jr z, .div_by_zero
    
    ld a, 16              ; 16 bits
    
.loop:
    ; Shift BC left, MSB into carry
    sla c
    rl b
    
    ; Shift carry into HL
    adc hl, hl
    
    ; Compare HL with DE
    push hl
    or a                  ; Clear carry
    sbc hl, de
    jr c, .no_sub
    
    ; HL >= DE, keep result
    pop bc                ; Discard old HL
    push hl               ; Save new HL (HL - DE)
    
    ; Set bit 0 of quotient
    inc c
    
.no_sub:
    pop hl                ; Restore HL
    
    dec a
    jr nz, .loop
    
    ; Result: HL = quotient, BC = remainder
    ld a, c
    ld c, l
    ld l, a
    
    ld a, b
    ld b, h
    ld h, a
    
    pop de
    ret
    
.div_by_zero:
    ; Return maximums
    ld hl, $FFFF
    ld bc, 0
    
    pop de
    ret

; PRINT_CHAR: Print a character to the output buffer
; Input: A = character to print
; Output: None
print_char:
    push hl
    
    ld hl, (output_ptr)
    ld (hl), a
    inc hl
    ld (output_ptr), hl
    
    pop hl
    ret

; PRINT_STRING: Print a null-terminated string
; Input: HL = pointer to string
; Output: None
print_string:
    push bc
    
.loop:
    ld a, (hl)
    or a
    jr z, .done
    
    call print_char
    
    inc hl
    jr .loop
    
.done:
    pop bc
    ret

; ------------------------------
; Evaluator - LISP expression evaluation
; ------------------------------

; EVAL: Evaluate a LISP expression
; Input: BC = expression to evaluate, DE = environment
; Output: HL = evaluated result
eval:
    push bc
    push de
    
    ; Check if expression is an atom
    ld hl, bc
    call atom
    ld a, h
    or l
    jr z, .not_atom
    
    ; It's an atom, check type
    ld hl, bc
    ld bc, 3              ; CAR offset
    add hl, bc
    ld bc, (hl)           ; Get CAR value with type flags
    
    ; Check if it's a number
    ld a, b
    and NUM_FLAG >> 8
    jr nz, .self_eval
    
    ; It's a symbol, look it up in the environment
    pop de                ; Restore environment
    ld hl, bc             ; HL = symbol
    call lookup_variable
    pop bc
    ret
    
.not_atom:
    ; It's a list, get the operator (first element)
    pop de                ; Restore environment
    pop bc                ; Restore expression
    
    push bc               ; Save expression
    push de               ; Save environment
    
    ; Get the operator
    ld hl, bc
    call car
    ld bc, hl             ; BC = operator
    
    ; Check if it's a special form
    ld hl, (quote_symbol)
    call eq
    ld a, h
    or l
    jr nz, .eval_quote
    
    ld hl, bc             ; Restore operator to HL
    ld bc, (lambda_symbol)
    call eq
    ld a, h
    or l
    jr nz, .eval_lambda
    
    ld hl, bc             ; Restore operator to HL
    ld bc, (cond_symbol)
    call eq
    ld a, h
    or l
    jr nz, .eval_cond
    
    ld hl, bc             ; Restore operator to HL
    ld bc, (label_symbol)
    call eq
    ld a, h
    or l
    jr nz, .eval_label
    
    ; Not a special form, evaluate as function application
    pop de                ; Restore environment
    pop bc                ; Restore expression
    
    call eval_apply
    ret
    
.self_eval:
    ; Self-evaluating expressions (numbers) just return themselves
    pop de
    pop bc
    ld hl, bc
    ret
    
.eval_quote:
    ; Handle (QUOTE expr) - just return expr without evaluating
    pop de                ; Restore environment
    pop bc                ; Restore expression
    
    ; Get the argument to QUOTE (skip the QUOTE symbol)
    ld hl, bc
    call cdr
    ld bc, hl
    call car
    
    ld hl, bc
    ret
    
.eval_lambda:
    ; Handle (LAMBDA (arg1 arg2...) body)
    pop de                ; Restore environment
    pop bc                ; Restore expression
    
    ; For now, just return the lambda expression itself
    ; In a real implementation, we'd create a closure with the environment
    ld hl, bc
    ret
    
.eval_cond:
    ; Handle (COND (test1 expr1) (test2 expr2) ...)
    pop de                ; Restore environment
    pop bc                ; Restore expression
    
    ; Get the clauses (skip the COND symbol)
    ld hl, bc
    call cdr
    ld bc, hl
    
    ; Evaluate clauses one by one
    call eval_cond_clauses
    ret
    
.eval_label:
    ; Handle (LABEL name (LAMBDA (arg1 arg2...) body))
    pop de                ; Restore environment
    pop bc                ; Restore expression
    
    ; For now, just return the lambda expression
    ; In a full implementation, we'd handle recursive functions
    ld hl, bc
    call cdr              ; Skip LABEL
    ld bc, hl
    call cdr              ; Skip name
    ld bc, hl
    call car              ; Get lambda expression
    
    ld hl, bc
    ret

; EVAL_COND_CLAUSES: Evaluate COND clauses until one is true
; Input: BC = list of COND clauses, DE = environment
; Output: HL = result of first true clause
eval_cond_clauses:
    push bc
    push de
    
    ; Check if there are no more clauses
    ld hl, bc
    ld bc, NIL_ADDR
    call eq
    ld a, h
    or l
    jr nz, .no_clauses
    
    pop de                ; Restore environment
    pop bc                ; Restore clauses
    
    ; Get the first clause
    push bc               ; Save clauses
    push de               ; Save environment
    
    ld hl, bc
    call car
    ld bc, hl             ; BC = current clause
    
    ; Get test expression
    push bc               ; Save clause
    
    ld hl, bc
    call car
    ld bc, hl             ; BC = test expression
    
    ; Evaluate the test
    call eval             ; HL = result of test
    
    pop bc                ; Restore clause
    
    ; Check if the test is true (not NIL)
    push hl               ; Save test result
    
    ld bc, NIL_ADDR
    call eq
    ld a, h
    or l
    pop bc                ; BC = test result
    
    jr nz, .false_clause
    
    ; Test is true, evaluate the consequent
    pop de                ; Restore environment
    pop bc                ; Restore clause
    
    ld hl, bc
    call cdr
    ld bc, hl
    call car              ; Get consequent
    
    ; Evaluate the consequent
    call eval
    ret
    
.false_clause:
    ; Test is false, try the next clause
    pop de                ; Restore environment
    pop bc                ; Restore clauses
    
    ld hl, bc
    call cdr
    ld bc, hl             ; BC = rest of clauses
    
    call eval_cond_clauses
    ret
    
.no_clauses:
    ; No more clauses, return NIL
    ld hl, NIL_ADDR
    pop de
    pop bc
    ret

; EVAL_APPLY: Apply a function to arguments
; Input: BC = expression (fn arg1 arg2...), DE = environment
; Output: HL = result
eval_apply:
    push bc
    push de
    
    ; Get the function
    ld hl, bc
    call car
    
    ; Evaluate the function
    push bc               ; Save function
    push de               ; Save environment
    
    ld bc, hl
    call eval             ; HL = evaluated function
    
    pop de                ; Restore environment
    
    ; Save the evaluated function
    push hl
    
    ; Get the argument list
    pop bc                ; BC = evaluated function
    pop hl                ; HL = original expression
    call cdr
    push bc               ; Save function
    
    ; Evaluate the arguments
    ld bc, hl             ; BC = argument list
    call eval_args
    ld bc, hl             ; BC = evaluated arguments
    
    pop hl                ; HL = function
    
    ; Apply the function to the arguments
    call apply
    
    pop de
    pop bc
    ret

; EVAL_ARGS: Evaluate a list of arguments
; Input: BC = list of arguments, DE = environment
; Output: HL = list of evaluated arguments
eval_args:
    push bc
    push de
    
    ; Check if argument list is empty
    ld hl, bc
    ld bc, NIL_ADDR
    call eq
    ld a, h
    or l
    jr nz, .empty_args
    
    pop de                ; Restore environment
    pop bc                ; Restore argument list
    
    ; Evaluate the first argument
    push bc               ; Save argument list
    push de               ; Save environment
    
    ld hl, bc
    call car
    ld bc, hl             ; BC = first argument
    
    call eval             ; HL = evaluated first argument
    
    pop de                ; Restore environment
    
    ; Save the evaluated argument
    push hl
    
    ; Evaluate the rest of the arguments
    pop bc                ; BC = evaluated first argument
    pop hl                ; HL = original argument list
    push bc               ; Save evaluated first argument
    
    ld bc, hl
    call cdr
    ld bc, hl             ; BC = rest of arguments
    
    call eval_args        ; HL = evaluated rest of arguments
    
    ; Cons the first evaluated argument with the rest
    ld de, hl             ; DE = evaluated rest of arguments
    pop bc                ; BC = evaluated first argument
    
    call cons             ; HL = (evaluated-first . evaluated-rest)
    
    pop de
    pop bc
    ret
    
.empty_args:
    ; Return NIL for empty argument list
    ld hl, NIL_ADDR
    pop de
    pop bc
    ret

; APPLY: Apply a function to arguments
; Input: HL = function, BC = list of evaluated arguments
; Output: HL = result
apply:
    push bc
    push de
    
    ; Check if it's a primitive function
    push hl
    call atom
    pop de                ; DE = function
    
    ld a, h
    or l
    jr z, .not_primitive
    
    ; It's a primitive, dispatch based on name
    ; In a real implementation, we'd have a dispatch table
    
    ; For now, hardcode a few primitives
    ld hl, de
    ld de, 3              ; CAR offset
    add hl, de
    ld de, (hl)           ; DE = function CAR value
    
    ; Check for CAR
    ld a, e
    cp 'C'
    jr nz, .not_car
    
    ; Apply CAR
    pop de
    pop bc
    
    ; Get the first argument
    push bc
    ld hl, bc
    call car
    pop bc
    
    ; Apply CAR to it
    ld bc, hl
    call car
    ret
    
.not_car:
    ; Check for CDR
    ld a, e
    cp 'D'
    jr nz, .not_cdr
    
    ; Apply CDR
    pop de
    pop bc
    
    ; Get the first argument
    push bc
    ld hl, bc
    call car
    pop bc
    
    ; Apply CDR to it
    ld bc, hl
    call cdr
    ret
    
.not_cdr:
    ; Check for CONS
    ld a, e
    cp 'O'
    jr nz, .not_cons
    
    ; Apply CONS
    pop de
    pop bc
    
    ; Get the first argument
    push bc
    ld hl, bc
    call car
    ld de, hl             ; DE = first argument
    
    ; Get the second argument
    pop bc
    ld hl, bc
    call cdr
    ld bc, hl
    call car
    ld bc, hl             ; BC = second argument
    
    ; Apply CONS
    ld hl, de
    call cons
    ret
    
.not_cons:
    ; Unknown primitive, return NIL
    pop de
    pop bc
    ld hl, NIL_ADDR
    ret
    
.not_primitive:
    ; It's a lambda, apply it
    pop de                ; DE = function
    
    ; Check if it's a lambda
    ld hl, de
    ld bc, 3              ; CAR offset
    add hl, bc
    ld bc, (hl)           ; BC = function CAR value
    
    ; For now, just return the first argument (simplified)
    pop bc
    ld hl, bc
    call car
    ret

; LOOKUP_VARIABLE: Look up a variable in the environment
; Input: HL = variable name, DE = environment
; Output: HL = value
lookup_variable:
    push bc
    push de
    
    ; For a real implementation, we'd search the environment
    ; For now, just return the variable itself
    
    pop de
    pop bc
    ret

; INIT_ENVIRONMENT: Initialize the global environment
; Input: None
; Output: None
init_environment:
    ; For a real implementation, we'd initialize built-in functions
    ret

; ------------------------------
; Code Generation
; ------------------------------

; The code generator takes LISP expressions and produces Z80 assembly code
; We'll focus on a simple subset that can generate basic code

; GEN_CODE: Generate Z80 code from a LISP expression
; Input: BC = LISP expression
; Output: None (writes code to output buffer)
gen_code:
    push hl
    push de
    push bc
    
    ; Clear output buffer
    ld hl, OUTPUT_BUFFER
    ld (output_ptr), hl
    
    ; Call the code generator
    call gen_expr
    
    ; Null-terminate the output buffer
    ld hl, (output_ptr)
    ld (hl), 0
    
    ; Display the generated code
    ld hl, OUTPUT_BUFFER
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    pop bc
    pop de
    pop hl
    ret

; GEN_EXPR: Generate code for a LISP expression
; Input: BC = LISP expression
; Output: None (writes code to output buffer)
gen_expr:
    push hl
    push de
    push bc
    
    ; Check if expression is an atom
    ld hl, bc
    call atom
    ld a, h
    or l
    jr z, .not_atom
    
    ; It's an atom, generate code for it
    ld bc, hl
    call gen_atom
    
    pop bc
    pop de
    pop hl
    ret
    
.not_atom:
    ; It's a list, get the operator
    ld hl, bc
    call car
    ld bc, hl
    
    ; Check operator type
    push bc
    call atom
    pop bc
    
    ld a, h
    or l
    jr z, .not_operator
    
    ; It's an operator, dispatch based on name
    ld hl, bc
    ld bc, 3              ; CAR offset
    add hl, bc
    ld bc, (hl)           ; BC = operator CAR value
    
    ; Check for basic operations
    ld a, c
    
    cp 'A'                ; ADD
    jr z, .gen_add
    
    cp 'S'                ; SUB
    jr z, .gen_sub
    
    cp 'M'                ; MUL
    jr z, .gen_mul
    
    cp 'L'                ; LD
    jr z, .gen_ld
    
    ; Unknown operator, generate comment
    pop bc
    
    ld hl, str_unknown_op
    call print_string
    
    pop de
    pop hl
    ret
    
.not_operator:
    ; Not a recognized form, generate comment
    pop bc
    
    ld hl, str_unknown_form
    call print_string
    
    pop de
    pop hl
    ret
    
.gen_add:
    ; Generate ADD instruction
    pop bc                ; Restore original expression
    pop de
    pop hl
    
    push hl
    push de
    push bc
    
    ; Get the arguments
    ld hl, bc
    call cdr
    ld bc, hl
    
    ; Print ADD instruction
    ld hl, str_add
    call print_string
    
    ; Get first argument
    push bc
    ld hl, bc
    call car
    ld bc, hl
    call gen_expr
    pop bc
    
    ; Print comma
    ld a, ','
    call print_char
    
    ; Get second argument
    ld hl, bc
    call cdr
    ld bc, hl
    call car
    ld bc, hl
    call gen_expr
    
    ; Print newline
    ld a, 13
    call print_char
    ld a, 10
    call print_char
    
    pop bc
    pop de
    pop hl
    ret
    
.gen_sub:
    ; Generate SUB instruction (similar to ADD)
    pop bc                ; Restore original expression
    pop de
    pop hl
    
    push hl
    push de
    push bc
    
    ; Get the arguments
    ld hl, bc
    call cdr
    ld bc, hl
    
    ; Print SUB instruction
    ld hl, str_sub
    call print_string
    
    ; Get first argument
    push bc
    ld hl, bc
    call car
    ld bc, hl
    call gen_expr
    pop bc
    
    ; Print comma
    ld a, ','
    call print_char
    
    ; Get second argument
    ld hl, bc
    call cdr
    ld bc, hl
    call car
    ld bc, hl
    call gen_expr
    
    ; Print newline
    ld a, 13
    call print_char
    ld a, 10
    call print_char
    
    pop bc
    pop de
    pop hl
    ret
    
.gen_mul:
    ; Generate MUL-like operations (for ez80)
    pop bc                ; Restore original expression
    pop de
    pop hl
    
    push hl
    push de
    push bc
    
    ; Get the arguments
    ld hl, bc
    call cdr
    ld bc, hl
    
    ; Print MLT instruction
    ld hl, str_mlt
    call print_string
    
    ; Get first argument
    push bc
    ld hl, bc
    call car
    ld bc, hl
    call gen_expr
    pop bc
    
    ; Print newline
    ld a, 13
    call print_char
    ld a, 10
    call print_char
    
    pop bc
    pop de
    pop hl
    ret
    
.gen_ld:
    ; Generate LD instruction
    pop bc                ; Restore original expression
    pop de
    pop hl
    
    push hl
    push de
    push bc
    
    ; Get the arguments
    ld hl, bc
    call cdr
    ld bc, hl
    
    ; Print LD instruction
    ld hl, str_ld
    call print_string
    
    ; Get first argument (destination)
    push bc
    ld hl, bc
    call car
    ld bc, hl
    call gen_expr
    pop bc
    
    ; Print comma
    ld a, ','
    call print_char
    
    ; Get second argument (source)
    ld hl, bc
    call cdr
    ld bc, hl
    call car
    ld bc, hl
    call gen_expr
    
    ; Print newline
    ld a, 13
    call print_char
    ld a, 10
    call print_char
    
    pop bc
    pop de
    pop hl
    ret

; GEN_ATOM: Generate code for an atom
; Input: BC = atom
; Output: None (writes to output buffer)
gen_atom:
    push hl
    push de
    
    ; Check atom type
    ld hl, bc
    ld bc, 3              ; CAR offset
    add hl, bc
    ld bc, (hl)           ; BC = atom CAR value
    
    ; Check if it's a number
    ld a, b
    and NUM_FLAG >> 8
    jr nz, .number_atom
    
    ; It's a symbol, print it
    ; For now, just print the raw value (simplified)
    ld a, c
    and $3F               ; Remove flags
    call print_char
    
    pop de
    pop hl
    ret
    
.number_atom:
    ; Extract the number value
    ld a, b
    and $1F               ; Remove flags
    ld b, a
    
    ; Print the number
    call print_number
    
    pop de
    pop hl
    ret

; ------------------------------
; REPL - Read-Eval-Print Loop
; ------------------------------

; REPL: Main Read-Eval-Print Loop
; Input: None
; Output: None
repl:
    ; Display prompt
    ld hl, prompt
    ld bc, 0
    ld a, 0
    rst.lil $18
    
    ; Read input
    call read_line
    
    ; Check for exit command
    ld hl, INPUT_BUFFER
    ld bc, exit_cmd
    call strcmp
    jr z, .exit_repl
    
    ; Parse input
    ld hl, INPUT_BUFFER
    ld (input_ptr), hl
    call read
    
    ; Save the parsed expression
    push hl
    
    ; Check for code generation command
    pop bc
    push bc
    
    ld hl, bc
    call atom
    jr nz, .not_gen_cmd
    
    ld hl, bc
    ld bc, 3              ; CAR offset
    add hl, bc
    ld bc, (hl)           ; BC = atom CAR value
    
    ld a, c
    cp 'G'                ; 'G' for generate
    jr nz, .not_gen_cmd
    
    ; It's a code generation command
    pop bc
    call gen_code
    jr .continue_repl
    
.not_gen_cmd:
    ; Evaluate the expression
    pop bc
    
    ; Set up environment
    ld de, NIL_ADDR        ; Empty environment for now
    
    call eval
    
    ; Print the result
    ld bc, hl
    call print
    
.continue_repl:
    ; Continue the REPL
    jr repl
    
.exit_repl:
    ret

; READ_LINE: Read a line of input
; Input: None
; Output: None (fills INPUT_BUFFER)
read_line:
    push bc
    push de
    push hl
    
    ; Initialize buffer pointer
    ld hl, INPUT_BUFFER
    ld b, 0                 ; Character count
    
.read_loop:
    ; Read a character
    ld a, $01                ; MOS API: get key
    rst.lil $08
    
    ; Check for Enter key
    cp 13
    jr z, .end_line
    
    ; Check for backspace
    cp 8
    jr z, .backspace
    
    ; Check if buffer is full
    ld a, b
    cp INPUT_BUFFER_SIZE-1
    jr nc, .read_loop
    
    ; Store character in buffer
    ld a, c
    ld (hl), a
    inc hl
    inc b
    
    ; Echo character
    rst.lil $10
    
    jr .read_loop
    
.backspace:
    ; Check if buffer is empty
    ld a, b
    or a
    jr z, .read_loop
    
    ; Erase character
    ld a, 8
    rst.lil $10
    ld a, ' '
    rst.lil $10
    ld a, 8
    rst.lil $10
    
    ; Update buffer
    dec hl
    dec b
    
    jr .read_loop
    
.end_line:
    ; Add newline to console
    ld a, 13
    rst.lil $10
    ld a, 10
    rst.lil $10
    
    ; Null-terminate buffer
    ld (hl), 0
    
    pop hl
    pop de
    pop bc
    ret

; STRCMP: Compare two strings
; Input: HL = string1, BC = string2
; Output: Z flag set if equal
strcmp:
    push de
    
.loop:
    ld a, (hl)
    ld d, a
    ld a, (bc)
    cp d
    jr nz, .not_equal
    
    ; Check for end of strings
    or a
    jr z, .equal
    
    ; Next characters
    inc hl
    inc bc
    jr .loop
    
.not_equal:
    ; Strings are not equal
    or 1                    ; Clear Z flag
    pop de
    ret
    
.equal:
    ; Strings are equal
    xor a                   ; Set Z flag
    pop de
    ret

; ------------------------------
; String constants
; ------------------------------

prompt:
    .db "> ",0

welcome_msg:
    .db "Mini-LISP Bootstrap Compiler",13,10
    .db "Enter expressions or 'exit' to quit",13,10,0

exit_msg:
    .db "Exiting Mini-LISP",13,10,0

exit_cmd:
    .db "exit",0

str_nil:
    .db "NIL",0

str_unknown_op:
    .db "; Unknown operator",13,10,0

str_unknown_form:
    .db "; Unknown expression form",13,10,0

str_add:
    .db "    add ",0

str_sub:
    .db "    sub ",0

str_mlt:
    .db "    mlt ",0

str_ld:
    .db "    ld ",0

; Symbol names
sym_quote:
    .db "QUOTE",0

sym_lambda:
    .db "LAMBDA",0

sym_cond:
    .db "COND",0

sym_label:
    .db "LABEL",0


