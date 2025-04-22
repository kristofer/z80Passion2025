/************** Lispy: Scheme Interpreter in C ****************
 * Based on Peter Norvig's lis.py (http://norvig.com/lispy.html)
 **************************************************************/

 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
 #include <math.h>
 #include <stdbool.h>
 
 /*********************** Types ***********************/
 
 typedef enum {
     SYMBOL, NUMBER, LIST, PROCEDURE, PRIMITIVE
 } CellType;
 
 typedef struct Cell {
     CellType type;
     union {
         char *symbol;
         double number;
         struct {
             struct Cell **cells;
             int count;
             int capacity;
         } list;
         struct {
             struct Cell *params;
             struct Cell *body;
             struct Env *env;
         } procedure;
         struct Cell *(*primitive)(struct Cell*);
     } value;
 } Cell;
 
 typedef struct Env {
     struct Env *outer;
     char **symbols;
     Cell **values;
     int count;
     int capacity;
 } Env;
 
 /************** Function Declarations ****************/
 
 // Memory and initialization
 Cell *create_symbol(const char *s);
 Cell *create_number(double n);
 Cell *create_list(void);
 Cell *create_primitive(Cell *(*fn)(Cell*));
 Cell *create_procedure(Cell *params, Cell *body, Env *env);
 void free_cell(Cell *cell);
 Env *create_env(Env *outer);
 void free_env(Env *env);
 
 // List operations
 void list_append(Cell *list, Cell *item);
 Cell *list_get(Cell *list, int index);
 
 // Environment operations
 void env_set(Env *env, const char *symbol, Cell *value);
 Cell *env_get(Env *env, const char *symbol);
 Env *env_find(Env *env, const char *symbol);
 Env *standard_env(void);
 
 // Parsing
 Cell *parse(const char *program);
 char **tokenize(const char *s);
 Cell *read_from_tokens(char **tokens, int *pos);
 Cell *atom(const char *token);
 
 // Evaluation
 Cell *eval(Cell *x, Env *env);
 Cell *eval_list(Cell *list, Env *env);
 
 // Primitives
 Cell *prim_add(Cell *args);
 Cell *prim_subtract(Cell *args);
 Cell *prim_multiply(Cell *args);
 Cell *prim_divide(Cell *args);
 Cell *prim_greater(Cell *args);
 Cell *prim_less(Cell *args);
 Cell *prim_car(Cell *args);
 Cell *prim_cdr(Cell *args);
 Cell *prim_cons(Cell *args);
 Cell *prim_list(Cell *args);
 Cell *prim_is_list(Cell *args);
 Cell *prim_is_null(Cell *args);
 Cell *prim_is_number(Cell *args);
 Cell *prim_is_symbol(Cell *args);
 Cell *prim_begin(Cell *args);
 
 // Other utilities
 void print_expr(Cell *cell);
 char *cell_to_string(Cell *exp);
 void repl(Env *env);
 
 // Global environment
 Env *global_env;
 
 /*********************** Implementation ***********************/
 
 // Memory and initialization
 Cell *create_symbol(const char *s) {
     Cell *cell = malloc(sizeof(Cell));
     cell->type = SYMBOL;
     cell->value.symbol = strdup(s);
     return cell;
 }
 
 Cell *create_number(double n) {
     Cell *cell = malloc(sizeof(Cell));
     cell->type = NUMBER;
     cell->value.number = n;
     return cell;
 }
 
 Cell *create_list(void) {
     Cell *cell = malloc(sizeof(Cell));
     cell->type = LIST;
     cell->value.list.cells = NULL;
     cell->value.list.count = 0;
     cell->value.list.capacity = 0;
     return cell;
 }
 
 Cell *create_primitive(Cell *(*fn)(Cell*)) {
     Cell *cell = malloc(sizeof(Cell));
     cell->type = PRIMITIVE;
     cell->value.primitive = fn;
     return cell;
 }
 
 Cell *create_procedure(Cell *params, Cell *body, Env *env) {
     Cell *cell = malloc(sizeof(Cell));
     cell->type = PROCEDURE;
     cell->value.procedure.params = params;
     cell->value.procedure.body = body;
     cell->value.procedure.env = env;
     return cell;
 }
 
 void free_cell(Cell *cell) {
     if (cell == NULL) return;
     
     switch (cell->type) {
         case SYMBOL:
             free(cell->value.symbol);
             break;
         case LIST:
             for (int i = 0; i < cell->value.list.count; i++) {
                 free_cell(cell->value.list.cells[i]);
             }
             free(cell->value.list.cells);
             break;
         case PROCEDURE:
             free_cell(cell->value.procedure.params);
             free_cell(cell->value.procedure.body);
             // We don't free the env here to avoid double-free
             break;
         default:
             break;
     }
     free(cell);
 }
 
 Env *create_env(Env *outer) {
     Env *env = malloc(sizeof(Env));
     env->outer = outer;
     env->symbols = NULL;
     env->values = NULL;
     env->count = 0;
     env->capacity = 0;
     return env;
 }
 
 void free_env(Env *env) {
     if (env == NULL) return;
     
     for (int i = 0; i < env->count; i++) {
         free(env->symbols[i]);
         // We don't free the values here since they might be shared
     }
     free(env->symbols);
     free(env->values);
     free(env);
 }
 
 // List operations
 void list_append(Cell *list, Cell *item) {
     if (list->type != LIST) {
         fprintf(stderr, "Error: Cannot append to non-list\n");
         return;
     }
     
     if (list->value.list.count == list->value.list.capacity) {
         list->value.list.capacity = list->value.list.capacity ? list->value.list.capacity * 2 : 8;
         list->value.list.cells = realloc(list->value.list.cells, 
                                         list->value.list.capacity * sizeof(Cell*));
     }
     
     list->value.list.cells[list->value.list.count++] = item;
 }
 
 Cell *list_get(Cell *list, int index) {
     if (list->type != LIST || index < 0 || index >= list->value.list.count) {
         return NULL;
     }
     return list->value.list.cells[index];
 }
 
 // Environment operations
 void env_set(Env *env, const char *symbol, Cell *value) {
     // First check if the symbol already exists
     for (int i = 0; i < env->count; i++) {
         if (strcmp(env->symbols[i], symbol) == 0) {
             env->values[i] = value;
             return;
         }
     }
     
     // Symbol doesn't exist, add it
     if (env->count == env->capacity) {
         env->capacity = env->capacity ? env->capacity * 2 : 8;
         env->symbols = realloc(env->symbols, env->capacity * sizeof(char*));
         env->values = realloc(env->values, env->capacity * sizeof(Cell*));
     }
     
     env->symbols[env->count] = strdup(symbol);
     env->values[env->count] = value;
     env->count++;
 }
 
 Cell *env_get(Env *env, const char *symbol) {
     Env *e = env_find(env, symbol);
     if (e == NULL) {
         fprintf(stderr, "Error: Undefined symbol '%s'\n", symbol);
         return NULL;
     }
     
     for (int i = 0; i < e->count; i++) {
         if (strcmp(e->symbols[i], symbol) == 0) {
             return e->values[i];
         }
     }
     
     return NULL; // Should never get here
 }
 
 Env *env_find(Env *env, const char *symbol) {
     if (env == NULL) return NULL;
     
     for (int i = 0; i < env->count; i++) {
         if (strcmp(env->symbols[i], symbol) == 0) {
             return env;
         }
     }
     
     return env_find(env->outer, symbol);
 }
 
 Env *standard_env(void) {
     Env *env = create_env(NULL);
     
     // Mathematical operations
     env_set(env, "+", create_primitive(prim_add));
     env_set(env, "-", create_primitive(prim_subtract));
     env_set(env, "*", create_primitive(prim_multiply));
     env_set(env, "/", create_primitive(prim_divide));
     env_set(env, ">", create_primitive(prim_greater));
     env_set(env, "<", create_primitive(prim_less));
     
     // List operations
     env_set(env, "car", create_primitive(prim_car));
     env_set(env, "cdr", create_primitive(prim_cdr));
     env_set(env, "cons", create_primitive(prim_cons));
     env_set(env, "list", create_primitive(prim_list));
     env_set(env, "list?", create_primitive(prim_is_list));
     env_set(env, "null?", create_primitive(prim_is_null));
     env_set(env, "number?", create_primitive(prim_is_number));
     env_set(env, "symbol?", create_primitive(prim_is_symbol));
     
     // Other procedures
     env_set(env, "begin", create_primitive(prim_begin));
     
     // Mathematical constants
     env_set(env, "pi", create_number(M_PI));
     
     return env;
 }
 
 // Parsing
 char **tokenize(const char *s) {
     // Allocate space for tokens
     int capacity = 10;
     char **tokens = malloc(capacity * sizeof(char*));
     int count = 0;
     
     // Copy the input string since we'll modify it
     char *str = strdup(s);
     char *token = strtok(str, " \t\n\r()");
     
     // Add opening parentheses
     for (const char *p = s; *p; p++) {
         if (*p == '(') {
             if (count == capacity) {
                 capacity *= 2;
                 tokens = realloc(tokens, capacity * sizeof(char*));
             }
             tokens[count++] = strdup("(");
         }
         else if (*p == ')') {
             if (count == capacity) {
                 capacity *= 2;
                 tokens = realloc(tokens, capacity * sizeof(char*));
             }
             tokens[count++] = strdup(")");
         }
     }
     
     // Add regular tokens
     while (token != NULL) {
         if (count == capacity) {
             capacity *= 2;
             tokens = realloc(tokens, capacity * sizeof(char*));
         }
         tokens[count++] = strdup(token);
         token = strtok(NULL, " \t\n\r()");
     }
     
     // Null-terminate the array
     if (count == capacity) {
         capacity += 1;
         tokens = realloc(tokens, capacity * sizeof(char*));
     }
     tokens[count] = NULL;
     
     free(str);
     return tokens;
 }
 
 Cell *atom(const char *token) {
     // Try to parse as number
     char *endptr;
     double n = strtod(token, &endptr);
     if (*endptr == '\0') {
         return create_number(n);
     }
     
     // Otherwise, it's a symbol
     return create_symbol(token);
 }
 
 Cell *read_from_tokens(char **tokens, int *pos) {
     if (tokens[*pos] == NULL) {
         fprintf(stderr, "Error: Unexpected EOF while reading\n");
         return NULL;
     }
     
     char *token = tokens[(*pos)++];
     
     if (strcmp(token, "(") == 0) {
         Cell *list = create_list();
         
         while (tokens[*pos] != NULL && strcmp(tokens[*pos], ")") != 0) {
             Cell *item = read_from_tokens(tokens, pos);
             list_append(list, item);
         }
         
         if (tokens[*pos] == NULL) {
             fprintf(stderr, "Error: Unexpected EOF, expected ')'\n");
             free_cell(list);
             return NULL;
         }
         
         (*pos)++; // Skip over ')'
         return list;
     }
     else if (strcmp(token, ")") == 0) {
         fprintf(stderr, "Error: Unexpected ')'\n");
         return NULL;
     }
     else {
         return atom(token);
     }
 }
 
 Cell *parse(const char *program) {
     char **tokens = tokenize(program);
     int pos = 0;
     
     Cell *result = read_from_tokens(tokens, &pos);
     
     // Free the tokens
     for (int i = 0; tokens[i] != NULL; i++) {
         free(tokens[i]);
     }
     free(tokens);
     
     return result;
 }
 
 // Evaluation
 Cell *eval(Cell *x, Env *env) {
     if (x == NULL) return NULL;
     
     // Symbol - look up the value in the environment
     if (x->type == SYMBOL) {
         return env_get(env, x->value.symbol);
     }
     
     // Number - return itself
     if (x->type == NUMBER) {
         return x;
     }
     
     // Empty list
     if (x->type == LIST && x->value.list.count == 0) {
         return x;
     }
     
     // List - process based on first element
     if (x->type == LIST) {
         Cell *first = list_get(x, 0);
         
         // Special forms
         if (first->type == SYMBOL) {
             // (quote exp)
             if (strcmp(first->value.symbol, "quote") == 0) {
                 if (x->value.list.count != 2) {
                     fprintf(stderr, "Error: quote requires exactly one argument\n");
                     return NULL;
                 }
                 return list_get(x, 1);
             }
             
             // (if test conseq alt)
             if (strcmp(first->value.symbol, "if") == 0) {
                 if (x->value.list.count != 4) {
                     fprintf(stderr, "Error: if requires exactly three arguments\n");
                     return NULL;
                 }
                 
                 Cell *test = eval(list_get(x, 1), env);
                 Cell *result;
                 
                 if (test != NULL && !(test->type == LIST && test->value.list.count == 0)) {
                     result = eval(list_get(x, 2), env);
                 } else {
                     result = eval(list_get(x, 3), env);
                 }
                 
                 return result;
             }
             
             // (define var exp)
             if (strcmp(first->value.symbol, "define") == 0) {
                 if (x->value.list.count != 3) {
                     fprintf(stderr, "Error: define requires exactly two arguments\n");
                     return NULL;
                 }
                 
                 Cell *var = list_get(x, 1);
                 if (var->type != SYMBOL) {
                     fprintf(stderr, "Error: define requires a symbol as first argument\n");
                     return NULL;
                 }
                 
                 Cell *exp = eval(list_get(x, 2), env);
                 env_set(env, var->value.symbol, exp);
                 return NULL;
             }
             
             // (set! var exp)
             if (strcmp(first->value.symbol, "set!") == 0) {
                 if (x->value.list.count != 3) {
                     fprintf(stderr, "Error: set! requires exactly two arguments\n");
                     return NULL;
                 }
                 
                 Cell *var = list_get(x, 1);
                 if (var->type != SYMBOL) {
                     fprintf(stderr, "Error: set! requires a symbol as first argument\n");
                     return NULL;
                 }
                 
                 Env *e = env_find(env, var->value.symbol);
                 if (e == NULL) {
                     fprintf(stderr, "Error: Undefined symbol '%s'\n", var->value.symbol);
                     return NULL;
                 }
                 
                 Cell *exp = eval(list_get(x, 2), env);
                 env_set(e, var->value.symbol, exp);
                 return NULL;
             }
             
             // (lambda (var...) body)
             if (strcmp(first->value.symbol, "lambda") == 0) {
                 if (x->value.list.count != 3) {
                     fprintf(stderr, "Error: lambda requires exactly two arguments\n");
                     return NULL;
                 }
                 
                 Cell *params = list_get(x, 1);
                 Cell *body = list_get(x, 2);
                 
                 return create_procedure(params, body, env);
             }
         }
         
         // Function application
         Cell *proc = eval(first, env);
         
         // Create a list of evaluated arguments
         Cell *args = create_list();
         for (int i = 1; i < x->value.list.count; i++) {
             list_append(args, eval(list_get(x, i), env));
         }
         
         // Apply the procedure
         if (proc->type == PRIMITIVE) {
             return proc->value.primitive(args);
         }
         else if (proc->type == PROCEDURE) {
             // Create a new environment with params bound to args
             Env *new_env = create_env(proc->value.procedure.env);
             
             Cell *params = proc->value.procedure.params;
             
             if (params->type != LIST) {
                 fprintf(stderr, "Error: Lambda parameters must be a list\n");
                 free_env(new_env);
                 return NULL;
             }
             
             // Bind parameters to arguments
             if (params->value.list.count != args->value.list.count) {
                 fprintf(stderr, "Error: Expected %d arguments, got %d\n",
                         params->value.list.count, args->value.list.count);
                 free_env(new_env);
                 return NULL;
             }
             
             for (int i = 0; i < params->value.list.count; i++) {
                 Cell *param = list_get(params, i);
                 if (param->type != SYMBOL) {
                     fprintf(stderr, "Error: Lambda parameter must be a symbol\n");
                     free_env(new_env);
                     return NULL;
                 }
                 
                 env_set(new_env, param->value.symbol, list_get(args, i));
             }
             
             // Evaluate the body in the new environment
             Cell *result = eval(proc->value.procedure.body, new_env);
             
             // Free the new environment but not its outer environment
             free_env(new_env);
             
             return result;
         }
         else {
             fprintf(stderr, "Error: Not a procedure\n");
             return NULL;
         }
     }
     
     fprintf(stderr, "Error: Unknown expression type\n");
     return NULL;
 }
 
 // Primitive functions
 Cell *prim_add(Cell *args) {
     double result = 0;
     
     for (int i = 0; i < args->value.list.count; i++) {
         Cell *arg = list_get(args, i);
         if (arg->type != NUMBER) {
             fprintf(stderr, "Error: + requires number arguments\n");
             return NULL;
         }
         result += arg->value.number;
     }
     
     return create_number(result);
 }
 
 Cell *prim_subtract(Cell *args) {
     if (args->value.list.count == 0) {
         fprintf(stderr, "Error: - requires at least one argument\n");
         return NULL;
     }
     
     Cell *first = list_get(args, 0);
     if (first->type != NUMBER) {
         fprintf(stderr, "Error: - requires number arguments\n");
         return NULL;
     }
     
     double result = first->value.number;
     
     if (args->value.list.count == 1) {
         // Unary minus
         return create_number(-result);
     }
     
     for (int i = 1; i < args->value.list.count; i++) {
         Cell *arg = list_get(args, i);
         if (arg->type != NUMBER) {
             fprintf(stderr, "Error: - requires number arguments\n");
             return NULL;
         }
         result -= arg->value.number;
     }
     
     return create_number(result);
 }
 
 Cell *prim_multiply(Cell *args) {
     double result = 1;
     
     for (int i = 0; i < args->value.list.count; i++) {
         Cell *arg = list_get(args, i);
         if (arg->type != NUMBER) {
             fprintf(stderr, "Error: * requires number arguments\n");
             return NULL;
         }
         result *= arg->value.number;
     }
     
     return create_number(result);
 }
 
 Cell *prim_divide(Cell *args) {
     if (args->value.list.count == 0) {
         fprintf(stderr, "Error: / requires at least one argument\n");
         return NULL;
     }
     
     Cell *first = list_get(args, 0);
     if (first->type != NUMBER) {
         fprintf(stderr, "Error: / requires number arguments\n");
         return NULL;
     }
     
     double result = first->value.number;
     
     if (args->value.list.count == 1) {
         // Reciprocal
         if (result == 0) {
             fprintf(stderr, "Error: Division by zero\n");
             return NULL;
         }
         return create_number(1 / result);
     }
     
     for (int i = 1; i < args->value.list.count; i++) {
         Cell *arg = list_get(args, i);
         if (arg->type != NUMBER) {
             fprintf(stderr, "Error: / requires number arguments\n");
             return NULL;
         }
         
         if (arg->value.number == 0) {
             fprintf(stderr, "Error: Division by zero\n");
             return NULL;
         }
         
         result /= arg->value.number;
     }
     
     return create_number(result);
 }
 
 Cell *prim_greater(Cell *args) {
     if (args->value.list.count != 2) {
         fprintf(stderr, "Error: > requires exactly two arguments\n");
         return NULL;
     }
     
     Cell *a = list_get(args, 0);
     Cell *b = list_get(args, 1);
     
     if (a->type != NUMBER || b->type != NUMBER) {
         fprintf(stderr, "Error: > requires number arguments\n");
         return NULL;
     }
     
     return a->value.number > b->value.number ? create_symbol("#t") : create_list();
 }
 
 Cell *prim_less(Cell *args) {
     if (args->value.list.count != 2) {
         fprintf(stderr, "Error: < requires exactly two arguments\n");
         return NULL;
     }
     
     Cell *a = list_get(args, 0);
     Cell *b = list_get(args, 1);
     
     if (a->type != NUMBER || b->type != NUMBER) {
         fprintf(stderr, "Error: < requires number arguments\n");
         return NULL;
     }
     
     return a->value.number < b->value.number ? create_symbol("#t") : create_list();
 }
 
 Cell *prim_car(Cell *args) {
     if (args->value.list.count != 1) {
         fprintf(stderr, "Error: car requires exactly one argument\n");
         return NULL;
     }
     
     Cell *arg = list_get(args, 0);
     if (arg->type != LIST || arg->value.list.count == 0) {
         fprintf(stderr, "Error: car requires a non-empty list\n");
         return NULL;
     }
     
     return list_get(arg, 0);
 }
 
 Cell *prim_cdr(Cell *args) {
     if (args->value.list.count != 1) {
         fprintf(stderr, "Error: cdr requires exactly one argument\n");
         return NULL;
     }
     
     Cell *arg = list_get(args, 0);
     if (arg->type != LIST || arg->value.list.count == 0) {
         fprintf(stderr, "Error: cdr requires a non-empty list\n");
         return NULL;
     }
     
     Cell *result = create_list();
     for (int i = 1; i < arg->value.list.count; i++) {
         list_append(result, list_get(arg, i));
     }
     
     return result;
 }
 
 Cell *prim_cons(Cell *args) {
     if (args->value.list.count != 2) {
         fprintf(stderr, "Error: cons requires exactly two arguments\n");
         return NULL;
     }
     
     Cell *a = list_get(args, 0);
     Cell *b = list_get(args, 1);
     
     Cell *result = create_list();
     list_append(result, a);
     
     if (b->type == LIST) {
         for (int i = 0; i < b->value.list.count; i++) {
             list_append(result, list_get(b, i));
         }
     } else {
         list_append(result, b);
     }
     
     return result;
 }
 
 Cell *prim_list(Cell *args) {
     // Simply return the arg list itself
     return args;
 }
 
 Cell *prim_is_list(Cell *args) {
     if (args->value.list.count != 1) {
         fprintf(stderr, "Error: list? requires exactly one argument\n");
         return NULL;
     }
     
     Cell *arg = list_get(args, 0);
     return arg->type == LIST ? create_symbol("#t") : create_list();
 }
 
 Cell *prim_is_null(Cell *args) {
     if (args->value.list.count != 1) {
         fprintf(stderr, "Error: null? requires exactly one argument\n");
         return NULL;
     }
     
     Cell *arg = list_get(args, 0);
     return (arg->type == LIST && arg->value.list.count == 0) ? create_symbol("#t") : create_list();
 }
 
 Cell *prim_is_number(Cell *args) {
     if (args->value.list.count != 1) {
         fprintf(stderr, "Error: number? requires exactly one argument\n");
         return NULL;
     }
     
     Cell *arg = list_get(args, 0);
     return arg->type == NUMBER ? create_symbol("#t") : create_list();
 }
 
 Cell *prim_is_symbol(Cell *args) {
     if (args->value.list.count != 1) {
         fprintf(stderr, "Error: symbol? requires exactly one argument\n");
         return NULL;
     }
     
     Cell *arg = list_get(args, 0);
     return arg->type == SYMBOL ? create_symbol("#t") : create_list();
 }
 
 Cell *prim_begin(Cell *args) {
     if (args->value.list.count == 0) {
         return create_list();  // Empty begin returns empty list
     }
     
     // Return the last expression
     return list_get(args, args->value.list.count - 1);
 }
 
 // String conversion and printing
 char *cell_to_string(Cell *exp) {
     if (exp == NULL) {
         return strdup("NULL");
     }
     
     if (exp->type == SYMBOL) {
         return strdup(exp->value.symbol);
     }
     
     if (exp->type == NUMBER) {
         // Convert number to string with precision handling
         char buffer[64];
         double n = exp->value.number;
         if (n == (int)n) {
             sprintf(buffer, "%d", (int)n);
         } else {
             sprintf(buffer, "%g", n);
         }
         return strdup(buffer);
     }
     
     if (exp->type == LIST) {
         // Calculate the required buffer size
         int size = 2;  // Start with space for ( and )
         for (int i = 0; i < exp->value.list.count; i++) {
             char *elem = cell_to_string(list_get(exp, i));
             size += strlen(elem) + 1;  // +1 for space
             free(elem);
         }
         
         char *buffer = malloc(size + 1);  // +1 for null terminator
         strcpy(buffer, "(");
         
         for (int i = 0; i < exp->value.list.count; i++) {
             if (i > 0) {
                 strcat(buffer, " ");
             }
             
             char *elem = cell_to_string(list_get(exp, i));
             strcat(buffer, elem);
             free(elem);
         }
         
         strcat(buffer, ")");
         return buffer;
     }
     
     if (exp->type == PROCEDURE) {
         return strdup("<procedure>");
     }
     
     if (exp->type == PRIMITIVE) {
         return strdup("<primitive>");
     }
     
     return strdup("<unknown>");
 }
 
 void print_expr(Cell *cell) {
     char *s = cell_to_string(cell);
     printf("%s", s);
     free(s);
 }
 
 // REPL
 void repl(Env *env) {
     char input[1024];
     
     printf("lisp> ");
     while (fgets(input, sizeof(input), stdin)) {
         Cell *expr = parse(input);
         if (expr != NULL) {
             Cell *result = eval(expr, env);
             if (result != NULL) {
                 print_expr(result);
                 printf("\n");
             }
             free_cell(expr);
         }
         printf("lisp> ");
     }
     printf("\n");
 }
 
 int main() {
     global_env = standard_env();
     repl(global_env);
     free_env(global_env);
     return 0;
 }
/************** End of Lispy: Scheme Interpreter in C ****************/
// This code is a simple Scheme interpreter written in C, based on Peter Norvig's lis.py.
// It includes basic features like arithmetic operations, list manipulation, and a REPL.    