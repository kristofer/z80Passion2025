
; ------------------------------
; Utility functions
; ------------------------------
hex_buffer:        
    .ds 7        ; Room for 4 hex digits + null terminator

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
