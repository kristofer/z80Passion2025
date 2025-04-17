;;; LISP TO C COMPILER
;;; NILS M HOLM, 2020
;;;
;;; IN THE PUBLIC DOMAIN
;;;
;;; WHERE THERE IS NO PUBLIC DOMAIN, THE
;;; CREATIVE COMMONS ZERO (CC0) LICENSE APPLIES

(SETQ LIMIT (QUOTE (6 5 5 3 5)))

(SETQ NIL-ADDR (QUOTE (0)))
(SETQ T-ADDR (QUOTE (1)))

(SETQ ADDR (QUOTE (9 9)))

(SETQ SUCC
  (LAMBDA (X)
    (CADR (ASSOC X (QUOTE ((0 1) (1 2) (2 3)
                           (3 4) (4 5) (5 6)
                           (6 7) (7 8) (8 9)
                           (9 0)))))))

(SETQ INCR
  (LAMBDA (X)
    (LABEL
      ((LOOP (LAMBDA (X C Y)
         (COND ((EQ X NIL)
                 (COND (C (CONS (QUOTE 1) Y)) (T Y)))
               (C (SETQ INCR-TMP (SUCC (CAR X)))
                  (LOOP (CDR X)
                        (EQ INCR-TMP (QUOTE 0))
                        (CONS INCR-TMP Y)))
               (T (LOOP (CDR X)
                        NIL
                        (CONS (CAR X) Y)))))))
      (LOOP (REVERSE X) T NIL))))

(SETQ NUMBER MAKESYM)

(SETQ CELLS NIL)

(SETQ SYMLIS (LIST (LIST T (QUOTE (T 1)))))

(SETQ OBLIST NIL)

(SETQ LBL (QUOTE (0)))

(SETQ MAKE-LABEL
  (LAMBDA ()
    (SETQ LBL (INCR LBL))
    LBL))

(SETQ MAKE-CELL
  (LAMBDA (A D TG)
    (SETQ ADDR (INCR ADDR))
    (SETQ CELLS (CONS (LIST ADDR TG A D) CELLS))
    ADDR))

(SETQ MAKE-ATOM
  (LAMBDA (X)
    (LABEL
      ((LOOP (LAMBDA (X P)
         (COND ((EQ X NIL)
                 (MAKE-CELL P NIL-ADDR NIL))
               (T (LOOP (CDR X)
                        (MAKE-CELL (CAR X) P T)))))))
      (LOOP (NREVERSE (EXPLODE X)) NIL-ADDR))))

; (SETQ ADD-ATOM
;   (LAMBDA (X)
;     (LABEL ((V (ASSOC X SYMLIS)))
;       (COND (V (CDR V))
;             (T (SETQ SYMLIS (CONS (CONS X (MAKE-ATOM X))
;                                   SYMLIS))
;                (CDAR SYMLIS))))))

(SETQ FIRST
  (LAMBDA (X)
    (INTERN (CONS (MKNAME (*CAR X) NIL) NIL))))

(SETQ ADD-ATOM
  (LAMBDA (X)
    (LABEL ((F (FIRST X))
            (B (ASSOC F SYMLIS)))
      (COND (B (LABEL ((V (ASSOC X (CDR B))))
                 (COND (V (CDR V))
                       (T (LABEL ((A (MAKE-ATOM X)))
                            (RPLACD B (CONS (CONS X A)
                                            (CDR B)))
                            A)))))
            (T (LABEL ((A (MAKE-ATOM X)))
                 (SETQ SYMLIS
                       (CONS (CONS F (LIST (CONS X A)))
                             SYMLIS))
                 A))))))

(SETQ MAKE-OBJECT
  (LAMBDA (X)
    (COND ((EQ X NIL) NIL-ADDR)
          ((EQ X T) T-ADDR)
          ((ATOM X) (ADD-ATOM X))
          (T (MAKE-CELL (MAKE-OBJECT (CAR X))
                        (MAKE-OBJECT (CDR X))
                        NIL)))))

(SETQ ADD-OBJECT
  (LAMBDA (X)
    (COND ((EQ X NIL) NIL-ADDR)
          ((EQ X T) T-ADDR)
          ((ATOM X) (ADD-ATOM X))
          (T (SETQ OBLIST (CONS (MAKE-OBJECT X)
                                OBLIST))
             (CAR OBLIST)))))

(SETQ EMIT
  (LAMBDA X
    (LABEL
      ((LOOP (LAMBDA (X)
         (COND ((EQ X NIL)
                 (TERPRI))
               (T (PRIN1 (CAR X))
                  (LOOP (CDR X)))))))
      (LOOP X))))

(SETQ BLOCKCOM
  (LAMBDA (X TA)
     (COND ((EQ X NIL))
           ((EQ (CDR X) NIL)
             (EXPRCOM (CAR X) TA))
           (T (EXPRCOM (CAR X) NIL)
              (BLOCKCOM (CDR X) TA)))))

(SETQ CONDCOM
  (LAMBDA (X TA)
    (COND ((EQ X NIL)
            (EMIT "REF(EXPR) = NIL;"))
          ((EQ T (CAAR X))
            (COND ((EQ NIL (CDAR X))
                    (BLOCKCOM (CAR X) TA))
                  (T (BLOCKCOM (CDAR X) TA))))
          (T (EXPRCOM (CAAR X) NIL)
             (EMIT "IF (REF(EXPR) != NIL) {")
             (BLOCKCOM (CDAR X) TA)
             (EMIT "} ELSE {")
             (CONDCOM (CDR X) TA)
             (EMIT "}")))))

(SETQ VARSYMP
  (LAMBDA (X)
    (COND ((EQ X NIL) NIL)
          ((EQ X T) NIL)
          ((ATOM X)))))

(SETQ SETQCOM
  (LAMBDA (X)
    (COND ((NOT (VARSYMP (CADR X)))
            (HALT "SETQ: EXPECTED VARIABLE")))
    (EXPRCOM (CADDR X) NIL)
    (EMIT "VAL("
          (NUMBER (ADD-ATOM (CADR X)))
          ") = REF(EXPR);")))

(SETQ FUNCOM
  (LAMBDA (X)
    (LABEL
      ((SKIP (MAKE-LABEL))
       (FUN  (MAKE-LABEL)))
      (EMIT "GOTO(" (NUMBER SKIP) ");")
      (EMIT "LABEL(" (NUMBER FUN) ");")
      (EMIT "BIND(" (NUMBER (ADD-OBJECT (CADR X))) ");")
      (BLOCKCOM (CDDR X) T)
      (EMIT "UNBIND();")
      (EMIT "K = RETN(); BREAK;")
      (EMIT "LABEL(" (NUMBER SKIP) ");")
      (EMIT "REF(EXPR) = MKFUN(" (NUMBER FUN) ");"))))
;      (EMIT "REF(EXPR) = CONS3(CONS3(FUNTAG, CONS3("
;            (NUMBER FUN)
;            ", NIL, ATOMTAG), ATOMTAG), NIL, 0);"))))

(SETQ FUNAPP
  (LAMBDA (X TA)
    (EMIT "NEWFRAME();")
    (LABEL
      ((LOOP (LAMBDA (A)
         (COND ((EQ A NIL))
               (T (EXPRCOM (CAR A) NIL)
                  (EMIT "TOFRAME();")
                  (LOOP (CDR A)))))))
      (LOOP (REVERSE (CDR X))))
    (EXPRCOM (CAR X) NIL)
    (COND (TA (EMIT "K = APPLY(-1); BREAK;"))
          (T (LABEL ((RET (MAKE-LABEL)))
               (EMIT "K = APPLY("
                     (NUMBER RET)
                     "); BREAK;")
               (EMIT "LABEL("
                     (NUMBER RET) ");"))))))

(SETQ LABCOM
  (LAMBDA (X)
    (EMIT "NEWFRAME();")
    (LABEL
      ((LOOP (LAMBDA (X)
         (COND ((EQ X NIL))
               (T (COND ((NOT (VARSYMP (CAAR X)))
                          (HALT "LABEL: EXPECTED VARIABLE")))
                  (SETQ LABCOM-TMP
                        (NUMBER (ADD-ATOM (CAAR X))))
                  (EMIT "REF(EXPR) = CONS3("
                        LABCOM-TMP ", VAL("
                        LABCOM-TMP "), 0);")
                 (EMIT "TOFRAME();")
                 (EXPRCOM (CADAR X) NIL)
                 (EMIT "VAL("
                       (NUMBER (ADD-ATOM (CAAR X)))
                       ") = REF(EXPR);")
                 (LOOP (CDR X)))))))
      (LOOP (CADR X)))
    (EMIT "REF(EXPR) = NIL;")
    (EMIT "TOFRAME();")
    (BLOCKCOM (CDDR X) NIL)
    (EMIT "UNBIND();")
    (EMIT "POP();")))

(SETQ CHECKTAG
  (LAMBDA (X)
    (EXPRCOM (CADR X) NIL)
    (LABEL ((F (CADR (ASSOC (CAR X)
                       (QUOTE ((*ATOMP ATOMTAG)
                               (*MARKP MARKTAG)
                               (*TRAVP TRAVTAG)))))))
      (EMIT "REF(EXPR) = (TAG[REF(EXPR)] & "
            F ")? TRUE: NIL;"))))

(SETQ SETTAG
  (LAMBDA (X)
    (EXPRCOM (CADR X) NIL)
    (LABEL ((F (CADR (ASSOC (CAR X)
                       (QUOTE ((*SETATOM ATOMTAG)
                               (*SETMARK MARKTAG)
                               (*SETTRAV TRAVTAG)))))))
      (EMIT "TAG[REF(EXPR)]"
            (COND ((CADDR X) " |= ") (T " &= ~"))
            F ";"))))

(SETQ TWOARGS
  (LAMBDA (X)
    (EXPRCOM (CADDR X) NIL)
    (EMIT "PUSH();")
    (EXPRCOM (CADR X) NIL)
    (EMIT "REF(EXPR2) = POP();")))

(SETQ EXPRCOM
  (LAMBDA (X TA)
    (COND ((EQ NIL X)
            (EMIT "REF(EXPR) = NIL;"))
          ((EQ T X)
            (EMIT "REF(EXPR) = TRUE;"))
          ((EQ '*POOL X)
            (EMIT "REF(EXPR) = 0;"))
          ((EQ '*LIMIT X)
            (EMIT "REF(EXPR) = "
                  (NUMBER LIMIT) ";"))
          ((ATOM X)
            (EMIT "REF(EXPR) = VAL("
                  (NUMBER (ADD-ATOM X)) ");"))
          ((EQ 'COND (CAR X))
            (CONDCOM (CDR X) TA))
          ((EQ 'LABEL (CAR X))
            (LABCOM X))
          ((EQ 'LAMBDA (CAR X))
            (FUNCOM X))
          ((EQ 'PROGN (CAR X))
            (BLOCKCOM (CDR X) TA))
          ((EQ 'QUOTE (CAR X))
            (EMIT "REF(EXPR) = "
                  (NUMBER (ADD-OBJECT (CADR X)))
                  ";"))
          ((EQ 'SETQ (CAR X))
            (SETQCOM X))
          ((EQ 'ATOM (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "REF(EXPR) = ATOMIC()? TRUE: NIL;"))
          ((EQ 'CAR (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "IF (SYMBOLIC()) CAR_ERR();")
            (EMIT "REF(EXPR) = CAR[REF(EXPR)];"))
          ((EQ 'CDR (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "IF (SYMBOLIC()) CDR_ERR();")
            (EMIT "REF(EXPR) = CDR[REF(EXPR)];"))
          ((EQ 'CONS (CAR X))
            (TWOARGS X)
            (EMIT "REF(EXPR) = CONS3(REF(EXPR), "
                  "REF(EXPR2), 0);"))
          ((EQ 'EQ (CAR X))
            (TWOARGS X)
            (EMIT "REF(EXPR) = REF(EXPR) == REF(EXPR2)? "
                  "TRUE: NIL;"))
          ((EQ '*HALT (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "HALT(ATOMNAME(REF(EXPR)), "
                  (NUMBER LIMIT) ");"))
          ((MEMBER (CAR X) '(*ATOMP *MARKP *TRAVP))
            (CHECKTAG X))
          ((EQ '*CAR (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "REF(EXPR) = CAR[REF(EXPR)];"))
          ((EQ '*CDR (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "REF(EXPR) = CDR[REF(EXPR)];"))
          ((EQ '*DUMP (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "DUMP(REF(EXPR));"))
          ((EQ '*LOAD (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "LOAD(REF(EXPR));"))
          ((EQ '*NEXT (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "REF(EXPR)++;"))
          ((MEMBER (CAR X)
                   '(*SETATOM *SETMARK *SETTRAV))
            (SETTAG X))
          ((EQ '*READC (CAR X))
            (EMIT "REF(EXPR) = READC();"))
          ((EQ '*RPLACA (CAR X))
            (TWOARGS X)
            (EMIT "CAR[REF(EXPR)] = REF(EXPR2);"))
          ((EQ '*RPLACD (CAR X))
            (TWOARGS X)
            (EMIT "CDR[REF(EXPR)] = REF(EXPR2);"))
          ((EQ '*WRITEC (CAR X))
            (EXPRCOM (CADR X) NIL)
            (EMIT "WRITEC(REF(EXPR));"))
          ((NOT (ATOM (CAR X)))
            (FUNAPP X NIL))
          (T (FUNAPP X TA)))))

(SETQ PROLOG
  (LAMBDA ()
    (EMIT)
    (EMIT "/******** LISCMP OUTPUT FOLLOWS ********/")
    (EMIT)
    (EMIT "VOID RUN(VOID) {")
    (EMIT "INT K;")
    (EMIT "SETUP();")
    (EMIT "FOR (K=0;;) SWITCH (K) {")
    (EMIT "CASE 0:")))

(SETQ EMIT-OBLIST
  (LAMBDA ()
    (LABEL
      ((LOOP (LAMBDA (OL A)
         (COND ((EQ OL NIL)
                 (EMIT "REF(OBLIST) = " (NUMBER A) ";"))
               (T (LOOP (CDR OL) (MAKE-CELL (CAR OL) A NIL)))))))
      (LOOP OBLIST NIL-ADDR))))

(SETQ CHAR
  (LAMBDA (C)
    (COND ((EQ C *NL) "'\\N'")
          ((EQ C "'") "'\\''")
          ((EQ C "\\") "'\\\\'")
          (T (MAKESYM (LIST "U" "(" "'" C "'" ")"))))))

(SETQ INIT-CELLS
  (LAMBDA ()
    (LABEL
      ((INIT (LAMBDA (N)
         (LABEL ((X (NUMBER (CAAR N)))
                 (A (COND ((ATOM (CAR (CDDAR N)))
                            (CHAR (CAR (CDDAR N))))
                          (T (NUMBER (CAR (CDDAR N))))))
                 (D (NUMBER (CADR (CDDAR N))))
                 (F (COND ((CADAR N) "ATOMTAG") (T "0"))))
           (EMIT "CAR[" X "] = " A "; "
                 "CDR[" X "] = " D "; "
                 "TAG[" X "] = " F ";"))))
       (LOOP (LAMBDA (N)
         (COND ((EQ N NIL))
               (T (INIT N)
                  (LOOP (CDR N)))))))
      (LOOP CELLS))))

(SETQ EPILOG
  (LAMBDA ()
    (EMIT "RETURN;")
    (EMIT "}}")
    (EMIT)
    (EMIT "VOID SETUP(VOID) {")
;    (EMIT "REF(SYMLIS) = "
;          (NUMBER (MAKE-OBJECT (MAPCAR CAR SYMLIS))) ";"))
;    (LABEL
;      ((Y (RREDUCE APPEND NIL (MAPCAR CDR SYMLIS))))
;      (EMIT "REF(SYMLIS) = "
;            (NUMBER (MAKE-OBJECT (MAPCAR CAR Y)))
;            ";"))
    (LABEL
      ((Y (MAPCAR (LAMBDA (X)
                    (CONS (CAR X) (MAPCAR CAR (CDR X))))
                  SYMLIS)))
      (EMIT "REF(SYMLIS) = "
            (NUMBER (MAKE-OBJECT Y))
            ";"))
    (EMIT-OBLIST)
    (INIT-CELLS)
    (EMIT "}")))

(SETQ DUMP-POOL
  (LAMBDA ()
    (EMIT "/******** POOL DUMP FOLLOWS ********")
    (MAPCAR (LAMBDA (X)
              (PRIN1 (NUMBER (CAR X)))
              (PRIN1 " ")
              (PRIN1 (COND ((CADR X) "A") (T "-")))
              (PRIN1 " ")
              (PRIN1 (COND ((ATOM (CADDR X))
                             (CADDR X))
                           (T (NUMBER (CADDR X)))))
              (PRIN1 " ")
              (PRIN1 (NUMBER (CADDR (CDR X))))
              (TERPRI))
            CELLS)
    (EMIT "***********************************/")))

(SETQ LISCMP
  (LAMBDA ()
    (PROLOG)
    (LABEL
      ((LOOP (LAMBDA (X)
         (COND ((EQ (QUOTE *STOP) X))
               (T (EXPRCOM X NIL)
                  (LOOP (READ)))))))
      (LOOP (READ)))
    (EPILOG)
    (DUMP-POOL)))

(LISCMP)

*STOP
