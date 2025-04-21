#include <stdio.h>
#include <stdlib.h>
//#include <stdbool.h>
#include <string.h>

// Cell type definitions
// typedef enum {
//     CELL_ATOM,
//     CELL_PAIR
// } CellType;

// typedef struct Cell {
//     CellType type;
//     union {
//         char *atom;          // For atoms
//         struct {
//             struct Cell *car;
//             struct Cell *cdr;
//         } pair;              // For pairs
//     } value;
// } Cell;

// // Global NIL and T values
// Cell *NIL;
// Cell *T;

// Function prototypes
// Cell *cons(Cell *car, Cell *cdr);
// Cell *car(Cell *cell);
// Cell *cdr(Cell *cell);
// Cell *atom(Cell *cell);
// Cell *eq(Cell *a, Cell *b);
// Cell *make_atom(const char *name);
// void print_expr(Cell *expr);
// void init_lisp();
// void cleanup_lisp();
// int main(int argc, char *argv[]);

// Initialize LISP environment
// void init_lisp() {
//     // Create NIL as a special atom
//     NIL = (Cell*)malloc(sizeof(Cell));
//     printf("cr NIL\n");
//     NIL->type = CELL_ATOM;
//     printf("cr NIL->type\n");
//     NIL->value.atom = strdup("NIL");
//     printf("cr NIL->value.atom NIL\n");
    
//     // Create T as a special atom
//     T = (Cell*)malloc(sizeof(Cell));
//     T->type = CELL_ATOM;
//     T->value.atom = strdup("T");
// }

// Clean up LISP environment (very basic - not handling all memory)
// void cleanup_lisp() {
//     free(NIL->value.atom);
//     free(NIL);
//     free(T->value.atom);
//     free(T);
// }

// // CONS: Create a new pair
// Cell *cons(Cell *car, Cell *cdr) {
//     Cell *cell = (Cell*)malloc(sizeof(Cell));
//     cell->type = CELL_PAIR;
//     cell->value.pair.car = car;
//     cell->value.pair.cdr = cdr;
//     return cell;
// }

// // CAR: Get the first element of a pair
// Cell *car(Cell *cell) {
//     if (cell == NIL || cell->type != CELL_PAIR) {
//         return NIL;
//     }
//     return cell->value.pair.car;
// }

// // CDR: Get the rest of a pair
// Cell *cdr(Cell *cell) {
//     if (cell == NIL || cell->type != CELL_PAIR) {
//         return NIL;
//     }
//     return cell->value.pair.cdr;
// }

// // ATOM: Test if a cell is an atom
// Cell *atom(Cell *cell) {
//     if (cell == NIL || cell->type == CELL_ATOM) {
//         return T;
//     }
//     return NIL;
// }

// // EQ: Test if two cells are equal
// Cell *eq(Cell *a, Cell *b) {
//     // If both are the same object, they're equal
//     if (a == b) {
//         return T;
//     }
    
//     // If both are atoms, compare their names
//     if (a != NIL && b != NIL && a->type == CELL_ATOM && b->type == CELL_ATOM) {
//         if (strcmp(a->value.atom, b->value.atom) == 0) {
//             return T;
//         }
//     }
    
//     return NIL;
// }

// // Create a new atom with the given name
// Cell *make_atom(const char *name) {
//     // Check for NIL
//     if (strcmp(name, "NIL") == 0) {
//         return NIL;
//     }
    
//     // Check for T
//     if (strcmp(name, "T") == 0) {
//         return T;
//     }
    
//     // Create a new atom
//     Cell *atom = (Cell*)malloc(sizeof(Cell));
//     atom->type = CELL_ATOM;
//     atom->value.atom = strdup(name);
//     return atom;
// }

// Print a LISP expression
// void print_expr(Cell *expr) {
//     if (expr == NIL) {
//         printf("NIL");
//         return;
//     }
    
//     if (expr->type == CELL_ATOM) {
//         printf("%s", expr->value.atom);
//         return;
//     }
    
//     // Print a list: (a b c)
//     printf("(");
//    print_expr(car(expr));
    
    // Print the rest of the list
    // Cell *rest = cdr(expr);
    // while (rest != NIL && rest->type == CELL_PAIR) {
    //     printf(" ");
    //     print_expr(car(rest));
    //     rest = cdr(rest);
    // }
    
    // Handle dotted pairs: (a . b)
    // if (rest != NIL) {
    //     printf(" . ");
    //     print_expr(rest);
    // }
    
//     printf(")");
// }

// Simple test function
//void run_tests() {
    // Create some atoms
//     Cell *a = make_atom("A");
//     Cell *b = make_atom("B");
//     Cell *c = make_atom("C");
    
//     // Test CONS
//     Cell *pair = cons(a, b);
//     printf("CONS test: ");
//     print_expr(pair);
//     printf("\n");
    
//     // Test CAR
//     printf("CAR test: ");
//     print_expr(car(pair));
//     printf("\n");
    
//     // Test CDR
//     printf("CDR test: ");
//     print_expr(cdr(pair));
//     printf("\n");
    
//     // Test ATOM
//     printf("ATOM test on atom: ");
//     print_expr(atom(a));
//     printf("\n");
    
//     printf("ATOM test on pair: ");
//     print_expr(atom(pair));
//     printf("\n");
    
//     // Test EQ
//     printf("EQ test on same atom: ");
//     print_expr(eq(a, a));
//     printf("\n");
    
//     printf("EQ test on different atoms: ");
//     print_expr(eq(a, b));
//     printf("\n");
    
//     // Create a small list (A B C)
//     Cell *list = cons(a, cons(b, cons(c, NIL)));
//     printf("List test: ");
//     print_expr(list);
//     printf("\n");
//}

int main(int argc, char *argv[]) {
    // Initialize LISP environment
    printf("start\n");
    printf("init_lisp\n");
//    init_lisp();
    
    printf("Simple LISP Implementation\n");
    printf("-------------------------\n");
    
    // Run tests
//    run_tests();
    
    // Clean up
//    cleanup_lisp();
    
    return 0;
}
