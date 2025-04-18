# KLisp 
_Kristofer's LISP_

a simple ez80 LISP, an assembler bootstrap of lisp

My Initial Prompt:
_I have a small z80 16 bit computer with 512KB of memory. It is an ez80, which can handle 16-bit data and 24-bit addresses. 
I'd like to start the smallest possible LISP language compiler that can be used to bootstrap a larger LISP. 
The fundamental operators I need for this task are CONS, CAR, CDR, QUOTE,ATOM, EQ, LAMBDA, LABEL and COND.
It should have a means to produce z80 assembler code. Where do we start?_

Claude's suggestions:
I'd be happy to help you create a minimal LISP for bootstrapping on your ez80 system. Let's break this down step by step.

First, the ez80 is indeed a nice platform for this project since it's Z80-compatible but with 24-bit addressing that can access your full 512KB. This gives us plenty of room for both our minimal LISP and room to grow.

## Starting Point: The Minimum Viable LISP

Let's design a minimal LISP implementation that includes just the essential primitives you mentioned:
- CONS, CAR, CDR (list manipulation)
- QUOTE (for literals)
- ATOM, EQ (predicates)
- LAMBDA, LABEL (function definition)
- COND (conditionals)

Let's start by defining the core data structure and how we'll represent it in memory.

```assembly
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
```

Now, let's implement the core functions to manipulate these cells:

```assembly
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
```

Next, let's implement the basic CONS, CAR, and CDR operations:

```assembly
; CONS: Create a new cell with CAR=x, CDR=y
; Input: DE = x, HL = y
; Output: HL = address of new cell
cons:
    push    de                  ; Save x
    push    hl                  ; Save y
    
    ld      hl, (heap_ptr)      ; Get current heap pointer
    
    pop     de                  ; Get y
    ld      (hl), de            ; Store CDR
    inc     hl
    inc     hl
    
    pop     de                  ; Get x
    ld      (hl), de            ; Store CAR
    
    ld      hl, (heap_ptr)      ; Return the new cell address
    
    ; Update heap pointer
    ld      de, 4               ; Cell size is 4 bytes
    add     hl, de
    ld      (heap_ptr), hl
    
    ret

; CAR: Get the CAR of a cell
; Input: HL = cell address
; Output: HL = CAR value
car:
    ld      de, (hl)            ; Load CAR value
    ld      hl, de              ; Return in HL
    ret

; CDR: Get the CDR of a cell
; Input: HL = cell address
; Output: HL = CDR value
cdr:
    inc     hl                  ; Point to CDR
    inc     hl
    ld      de, (hl)            ; Load CDR value
    ld      hl, de              ; Return in HL
    ret
```

We should also implement the predicates:

```assembly
; ATOM: Is the value an atom?
; Input: HL = value
; Output: HL = T_ADDR if atom, NIL_ADDR if not
atom:
    ld      de, (hl)            ; Get CAR
    bit     7, d                ; Check if high bit is set
    jr      z, .not_atom
    ld      hl, T_ADDR
    ret
.not_atom:
    ld      hl, NIL_ADDR
    ret

; EQ: Are two values equal?
; Input: DE = value1, HL = value2
; Output: HL = T_ADDR if equal, NIL_ADDR if not
eq:
    ; Compare addresses
    or      a                   ; Clear carry
    sbc     hl, de              ; HL = HL - DE
    ld      hl, NIL_ADDR        ; Assume not equal
    ret     nz                  ; Return NIL if not equal
    ld      hl, T_ADDR          ; Return T if equal
    ret
```

For a more complete bootstrap LISP, we would next need to implement:

1. A simple reader (parser) to convert text into our internal representation
2. An evaluator for LISP expressions 
3. A printer to convert our internal representation back to text

Let's draft a simple evaluator for our minimal LISP:

```assembly
; EVAL: Evaluate a LISP expression
; Input: HL = expression to evaluate
; Output: HL = result
eval:
    push    bc                  ; Save registers
    
    ; Check if expression is an atom
    call    atom
    ld      a, h
    or      l
    jp      nz, .is_atom        ; If ATOM returns non-NIL, it's an atom
    
    ; It's a list, get the first element (operator)
    pop     bc                  ; Restore BC
    push    hl                  ; Save the expression
    call    car                 ; Get the operator
    
    ; Check what operator it is
    ; We'll need to compare against our known operators
    ; (This is simplified - a real implementation would be more complex)
    
    ; For now we'll return the expression unevaluated
    pop     hl                  ; Restore the expression
    ret
    
.is_atom:
    ; For atoms, just return them (except for symbols which need to be looked up)
    pop     bc                  ; Restore BC
    ret
```

To make a proper evaluator, we'd need to implement handling for each of our special forms (QUOTE, LAMBDA, COND) and function application. This would be quite complex for assembly language.

Let's now consider the overall architecture of our bootstrapped LISP:

## Bootstrapping Strategy

1. **First Phase**: Write in Z80 assembly:
   - Core memory management (cons cell allocation)
   - Basic list operations (cons, car, cdr)
   - Predicates (atom, eq)
   - Simple reader and printer
   - Minimal evaluator supporting our key primitives

2. **Second Phase**: Use our minimal LISP to implement:
   - More complex functions (like MAP, APPLY)
   - A proper environment for variables
   - Additional data types (numbers, strings)
   - A proper reader with more syntax support

3. **Third Phase**: Add the ability to generate Z80 code:
   - Create LISP functions to emit assembly
   - Implement a simple compiler targeting Z80

Do you want me to expand on any particular part of this design? I can go into more detail about the memory representation, how to implement the evaluator, or how to add code generation capabilities.
