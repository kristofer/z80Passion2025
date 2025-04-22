#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
#include <setjmp.h>

// Error handling
typedef enum {
    ERR_NONE,
    ERR_SYNTAX,
    ERR_UNBOUND_SYMBOL,
    ERR_TYPE_MISMATCH,
    ERR_INVALID_ARGUMENT,
    ERR_OUT_OF_MEMORY
} ErrorType;

// Global error state
ErrorType error_type = ERR_NONE;
char error_message[256];
jmp_buf error_jmp_buf;

// Cell type definitions
typedef enum {
    CELL_ATOM,
    CELL_PAIR,
    CELL_FUNCTION,
    CELL_SPECIAL    // For special forms like QUOTE, LAMBDA, etc.
} CellType;

typedef struct Cell {
    CellType type;
    union {
        char *atom;          // For atoms
        struct {
            struct Cell *car;
            struct Cell *cdr;
        } pair;              // For pairs
        struct Cell* (*func)(struct Cell*);  // For built-in functions
    } value;
} Cell;

// String reader structure
typedef struct {
    const char *input;
    size_t pos;
    size_t len;
} StringReader;

// Global values
Cell *NIL;
Cell *T;
Cell *QUOTE_SYM;
Cell *LAMBDA_SYM;
Cell *COND_SYM;
Cell *LABEL_SYM;

// Environment - a simple association list
Cell *env = NULL;

// Forward declarations
Cell *cons(Cell *car, Cell *cdr);
Cell *car(Cell *cell);
Cell *cdr(Cell *cell);
Cell *atom(Cell *cell);
Cell *eq(Cell *a, Cell *b);
Cell *make_atom(const char *name);
Cell *eval(Cell *expr, Cell *env);
Cell *apply(Cell *fn, Cell *args, Cell *env);
Cell *read_expr(StringReader *reader);
void print_expr(Cell *expr);
void init_lisp();
void cleanup_lisp();
Cell *bind(Cell *sym, Cell *val, Cell *env);
Cell *lookup(Cell *sym, Cell *env);
Cell *list_of_values(Cell *list, Cell *env);

// StringReader functions
StringReader create_string_reader(const char *input) {
    StringReader reader;
    reader.input = input;
    reader.pos = 0;
    reader.len = strlen(input);
    return reader;
}

int reader_getc(StringReader *reader) {
    if (reader->pos >= reader->len) {
        return EOF;
    }
    return reader->input[reader->pos++];
}

void reader_ungetc(StringReader *reader) {
    if (reader->pos > 0) {
        reader->pos--;
    }
}

// Error handling
void set_error(ErrorType type, const char *message) {
    error_type = type;
    strncpy(error_message, message, sizeof(error_message) - 1);
    error_message[sizeof(error_message) - 1] = '\0';
    longjmp(error_jmp_buf, 1);
}

void clear_error() {
    error_type = ERR_NONE;
    error_message[0] = '\0';
}

// Initialize LISP environment
void init_lisp() {
    // Create NIL as a special atom
    NIL = (Cell*)malloc(sizeof(Cell));
    if (!NIL) set_error(ERR_OUT_OF_MEMORY, "Failed to allocate NIL");
    NIL->type = CELL_ATOM;
    NIL->value.atom = strdup("NIL");
    
    // Create T as a special atom
    T = (Cell*)malloc(sizeof(Cell));
    if (!T) set_error(ERR_OUT_OF_MEMORY, "Failed to allocate T");
    T->type = CELL_ATOM;
    T->value.atom = strdup("T");
    
    // Create special symbols
    QUOTE_SYM = make_atom("QUOTE");
    LAMBDA_SYM = make_atom("LAMBDA");
    COND_SYM = make_atom("COND");
    LABEL_SYM = make_atom("LABEL");
    
    // // Initialize environment with built-in functions
    // env = NIL;
    // env = bind(make_atom("CONS"), make_atom("CONS"), env);
    // env = bind(make_atom("CAR"), make_atom("CAR"), env);
    // env = bind(make_atom("CDR"), make_atom("CDR"), env);
    // env = bind(make_atom("ATOM"), make_atom("ATOM"), env);
    // env = bind(make_atom("EQ"), make_atom("EQ"), env);
}

// Clean up LISP environment (basic - not handling all memory)
void cleanup_lisp() {
    free(NIL->value.atom);
    free(NIL);
    free(T->value.atom);
    free(T);
    // TODO: Free other memory
}

// CONS: Create a new pair
Cell *cons(Cell *car_val, Cell *cdr_val) {
    Cell *cell = (Cell*)malloc(sizeof(Cell));
    if (!cell) set_error(ERR_OUT_OF_MEMORY, "Failed to allocate cons cell");
    
    cell->type = CELL_PAIR;
    cell->value.pair.car = car_val;
    cell->value.pair.cdr = cdr_val;
    return cell;
}

// CAR: Get the first element of a pair
Cell *car(Cell *cell) {
    if (cell == NIL) {
        return NIL;
    }
    
    if (cell->type != CELL_PAIR) {
        set_error(ERR_TYPE_MISMATCH, "CAR: Expected a pair");
    }
    
    return cell->value.pair.car;
}

// CDR: Get the rest of a pair
Cell *cdr(Cell *cell) {
    if (cell == NIL) {
        return NIL;
    }
    
    if (cell->type != CELL_PAIR) {
        set_error(ERR_TYPE_MISMATCH, "CDR: Expected a pair");
    }
    
    return cell->value.pair.cdr;
}

// ATOM: Test if a cell is an atom
Cell *atom(Cell *cell) {
    if (cell == NIL || cell->type == CELL_ATOM) {
        return T;
    }
    return NIL;
}

// EQ: Test if two cells are equal
Cell *eq(Cell *a, Cell *b) {
    // If both are the same object, they're equal
    if (a == b) {
        return T;
    }
    
    // If both are atoms, compare their names
    if (a != NIL && b != NIL && a->type == CELL_ATOM && b->type == CELL_ATOM) {
        if (strcmp(a->value.atom, b->value.atom) == 0) {
            return T;
        }
    }
    
    return NIL;
}

// Create a new atom with the given name
Cell *make_atom(const char *name) {
    // Check for NIL
    if (strcmp(name, "NIL") == 0) {
        return NIL;
    }
    
    // Check for T
    if (strcmp(name, "T") == 0) {
        return T;
    }
    
    // Create a new atom
    Cell *atom = (Cell*)malloc(sizeof(Cell));
    if (!atom) set_error(ERR_OUT_OF_MEMORY, "Failed to allocate atom");
    
    atom->type = CELL_ATOM;
    atom->value.atom = strdup(name);
    if (!atom->value.atom) set_error(ERR_OUT_OF_MEMORY, "Failed to allocate atom name");
    
    return atom;
}

// Parser
Cell *read_expr(StringReader *reader) {
    int c;
    char token[256];
    int token_len = 0;
    
    // Skip whitespace
    while ((c = reader_getc(reader)) != EOF && isspace(c)) {
        // Skip
    }
    
    if (c == EOF) {
        return NULL;
    }
    
    // Check for list syntax
    if (c == '(') {
        // Read list elements
        Cell *head = NIL;
        Cell *tail = NIL;
        
        // Skip whitespace after open paren
        while ((c = reader_getc(reader)) != EOF && isspace(c)) {
            // Skip
        }
        
        // Check for empty list
        if (c == ')') {
            return NIL;
        }
        
        // Put back the non-whitespace character
        reader_ungetc(reader);
        
        // Read elements until closing paren
        while (1) {
            Cell *elem = read_expr(reader);
            if (!elem && error_type != ERR_NONE) {
                return NULL;
            }
            
            // Create list node
            Cell *node = cons(elem, NIL);
            
            if (head == NIL) {
                head = node;
                tail = node;
            } else {
                tail->value.pair.cdr = node;
                tail = node;
            }
            
            // Skip whitespace
            while ((c = reader_getc(reader)) != EOF && isspace(c)) {
                // Skip
            }
            
            if (c == ')') {
                break;
            } else if (c == '.') {
                // Handle dotted pair notation
                Cell *last = read_expr(reader);
                if (!last && error_type != ERR_NONE) {
                    return NULL;
                }
                
                tail->value.pair.cdr = last;
                
                // Expect closing paren
                while ((c = reader_getc(reader)) != EOF && isspace(c)) {
                    // Skip
                }
                
                if (c != ')') {
                    set_error(ERR_SYNTAX, "Expected ')' after dotted pair");
                    return NULL;
                }
                
                break;
            } else {
                // Put back the non-whitespace character for next element
                reader_ungetc(reader);
            }
        }
        
        return head;
    } else if (c == '\'') {
        // Handle quoted expressions: 'expr -> (QUOTE expr)
        Cell *quoted = read_expr(reader);
        if (!quoted && error_type != ERR_NONE) {
            return NULL;
        }
        
        return cons(QUOTE_SYM, cons(quoted, NIL));
    } else {
        // Read atom
        token[0] = c;
        token_len = 1;
        
        while ((c = reader_getc(reader)) != EOF && !isspace(c) && c != '(' && c != ')') {
            if (token_len < sizeof(token) - 1) {
                token[token_len++] = c;
            } else {
                set_error(ERR_SYNTAX, "Token too long");
                return NULL;
            }
        }
        
        // Put back the terminating character
        if (c != EOF) {
            reader_ungetc(reader);
        }
        
        // Null-terminate the token
        token[token_len] = '\0';
        
        // Check if it's a number (simplified - just integers)
        bool is_number = true;
        for (int i = 0; i < token_len; i++) {
            if (!isdigit(token[i])) {
                is_number = false;
                break;
            }
        }
        
        if (is_number) {
            // For now, we'll just treat numbers as special atoms
            return make_atom(token);
        } else {
            // It's a symbol
            return make_atom(token);
        }
    }
}

// // Print a LISP expression
void print_expr(Cell *expr) {
    if (expr == NIL) {
        printf("NIL");
        return;
    }
    
    if (expr->type == CELL_ATOM) {
        printf("%s", expr->value.atom);
        return;
    }
    
    if (expr->type == CELL_FUNCTION) {
        printf("<FUNCTION>");
        return;
    }
    
    if (expr->type == CELL_SPECIAL) {
        printf("<SPECIAL>");
        return;
    }
    
    // Print a list: (a b c)
    printf("(");
    print_expr(car(expr));
    
    // Print the rest of the list
    Cell *rest = cdr(expr);
    while (rest != NIL && rest->type == CELL_PAIR) {
        printf(" ");
        print_expr(car(rest));
        rest = cdr(rest);
    }
    
    // Handle dotted pairs: (a . b)
    if (rest != NIL) {
        printf(" . ");
        print_expr(rest);
    }
    
    printf(")");
}

// Environment functions
Cell *bind(Cell *sym, Cell *val, Cell *env) {
    return cons(cons(sym, val), env);
}

Cell *lookup(Cell *sym, Cell *env) {
    while (env != NIL) {
        Cell *binding = car(env);
        if (eq(car(binding), sym) == T) {
            return cdr(binding);
        }
        env = cdr(env);
    }
    
    char error_msg[256];
    sprintf(error_msg, "Unbound symbol: %s", sym->value.atom);
    set_error(ERR_UNBOUND_SYMBOL, error_msg);
    return NIL;
}

// Evaluate a list of expressions
Cell *list_of_values(Cell *list, Cell *env) {
    if (list == NIL) {
        return NIL;
    }
    
    return cons(eval(car(list), env), list_of_values(cdr(list), env));
}

// Evaluate a LISP expression
Cell *eval(Cell *expr, Cell *env) {
    // Self-evaluating expressions
    if (expr == NIL || expr->type == CELL_FUNCTION || expr->type == CELL_SPECIAL) {
        return expr;
    }
    
    // Atoms evaluate to their value in the environment
    if (expr->type == CELL_ATOM) {
        return lookup(expr, env);
    }
    
    // Lists are evaluated as function applications or special forms
    Cell *op = car(expr);
    Cell *args = cdr(expr);
    
    // Special forms
    if (op->type == CELL_ATOM) {
        // QUOTE: (QUOTE expr) -> expr
        if (eq(op, QUOTE_SYM) == T) {
            if (args == NIL || cdr(args) != NIL) {
                set_error(ERR_INVALID_ARGUMENT, "QUOTE requires exactly one argument");
            }
            return car(args);
        }
        
        // LAMBDA: (LAMBDA (args) body)
        if (eq(op, LAMBDA_SYM) == T) {
            // Just return the lambda expression for now
            // In a real implementation, we'd create a closure with the environment
            return expr;
        }
        
        // COND: (COND (test1 expr1) (test2 expr2) ...)
        if (eq(op, COND_SYM) == T) {
            Cell *clauses = args;
            
            while (clauses != NIL) {
                Cell *clause = car(clauses);
                
                if (clause->type != CELL_PAIR) {
                    set_error(ERR_INVALID_ARGUMENT, "COND: clause must be a list");
                }
                
                Cell *test = car(clause);
                Cell *result = eval(test, env);
                
                // If test evaluates to non-NIL, return the result expression
                if (result != NIL) {
                    Cell *expr = car(cdr(clause));
                    return eval(expr, env);
                }
                
                clauses = cdr(clauses);
            }
            
            // No matching clause
            return NIL;
        }
    }
    
    // Function application
    Cell *function = eval(op, env);
    Cell *evaluated_args = list_of_values(args, env);
    
    //return apply(function, evaluated_args, env);
    return function; // Placeholder for now
}

// Apply a function to arguments
// Cell *apply(Cell *fn, Cell *args, Cell *env) {
//     // Built-in functions
//     if (fn->type == CELL_ATOM) {
//         if (strcmp(fn->value.atom, "CONS") == 0) {
//             if (args == NIL || cdr(args) == NIL || cdr(cdr(args)) != NIL) {
//                 set_error(ERR_INVALID_ARGUMENT, "CONS requires exactly two arguments");
//             }
//             return cons(car(args), car(cdr(args)));
//         }
        
//         if (strcmp(fn->value.atom, "CAR") == 0) {
//             if (args == NIL || cdr(args) != NIL) {
//                 set_error(ERR_INVALID_ARGUMENT, "CAR requires exactly one argument");
//             }
//             return car(car(args));
//         }
        
//         if (strcmp(fn->value.atom, "CDR") == 0) {
//             if (args == NIL || cdr(args) != NIL) {
//                 set_error(ERR_INVALID_ARGUMENT, "CDR requires exactly one argument");
//             }
//             return cdr(car(args));
//         }
        
//         if (strcmp(fn->value.atom, "ATOM") == 0) {
//             if (args == NIL || cdr(args) != NIL) {
//                 set_error(ERR_INVALID_ARGUMENT, "ATOM requires exactly one argument");
//             }
//             return atom(car(args));
//         }
        
//         if (strcmp(fn->value.atom, "EQ") == 0) {
//             if (args == NIL || cdr(args) == NIL || cdr(cdr(args)) != NIL) {
//                 set_error(ERR_INVALID_ARGUMENT, "EQ requires exactly two arguments");
//             }
//             return eq(car(args), car(cdr(args)));
//         }
        
//         char error_msg[256];
//         sprintf(error_msg, "Unknown function: %s", fn->value.atom);
//         set_error(ERR_UNBOUND_SYMBOL, error_msg);
//         return NIL;
//     }
    
//     // Lambda expressions: (LAMBDA (params) body)
//     if (fn->type == CELL_PAIR && eq(car(fn), LAMBDA_SYM) == T) {
//         Cell *params = car(cdr(fn));
//         Cell *body = car(cdr(cdr(fn)));
        
//         // Create new environment with args bound to params
//         Cell *new_env = env;
//         Cell *param = params;
//         Cell *arg = args;
        
//         while (param != NIL && arg != NIL) {
//             new_env = bind(car(param), car(arg), new_env);
//             param = cdr(param);
//             arg = cdr(arg);
//         }
        
//         if (param != NIL) {
//             set_error(ERR_INVALID_ARGUMENT, "Too few arguments for lambda");
//         }
        
//         if (arg != NIL) {
//             set_error(ERR_INVALID_ARGUMENT, "Too many arguments for lambda");
//         }
        
//         // Evaluate body in new environment
//         return eval(body, new_env);
//     }
    
//     set_error(ERR_TYPE_MISMATCH, "Object is not a function");
//     return NIL;
// }

// REPL - Read-Eval-Print Loop
void repl() {
    char input[1024];
    
    printf("KLISP Interpreter\n");
    printf("Type expressions or 'exit' to quit\n");
    
    while (1) {
        printf("> ");
        fflush(stdout);
        
        if (!fgets(input, sizeof(input), stdin)) {
            break;
        }
        
        // Check for exit command
        if (strncmp(input, "exit", 4) == 0) {
            break;
        }
        
        // Handle errors with setjmp/longjmp
        if (setjmp(error_jmp_buf) == 0) {
            // Create a string reader from the input
            StringReader reader = create_string_reader(input);
            
            Cell *expr = read_expr(&reader);
            
            if (expr) {
                printf("**\n");
                print_expr(expr);
                printf("\n**\n");
                Cell *result = eval(expr, env);
                print_expr(result);
                printf("\n");
            }
        } else {
            // Error occurred
            printf("Error: %s\n", error_message);
            clear_error();
        }
    }
}

void run_tests() {
    printf("Tests: \n");
    // Create some atoms
    Cell *a = make_atom("A");
    Cell *b = make_atom("B");
    Cell *c = make_atom("C");
    printf("Atom Tests\n");

    printf("End Tests\n\n");
}

int main() {
    // Initialize error handling
    clear_error();
    run_tests();

    // Initialize LISP environment
    if (setjmp(error_jmp_buf) == 0) {
        init_lisp();
        repl();
    } else {
        printf("Fatal error during initialization: %s\n", error_message);
    }
    
    // Clean up
    cleanup_lisp();
    
    return 0;
}
