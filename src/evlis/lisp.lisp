;;; LISP LIBRARY
;;;
;;; NILS M HOLM, 2020
;;;
;;; IN THE PUBLIC DOMAIN
;;;
;;; WHERE THERE IS NO PUBLIC DOMAIN, THE
;;; CREATIVE COMMONS ZERO (CC0) LICENSE APPLIES

(SETQ *SYMLIS (*NEXT (*NEXT *POOL)))
(SETQ *FUNTAG (*NEXT
                (*NEXT
                  (*NEXT
                    (*NEXT
                      (*NEXT
                        (*NEXT *SYMLIS)))))))

(SETQ *LP "(")
(SETQ *RP ")")
(SETQ *NL "
")

(SETQ ATOM (LAMBDA (X) (ATOM X)))
(SETQ CAR (LAMBDA (X) (CAR X)))
(SETQ CDR (LAMBDA (X) (CDR X)))
(SETQ CONS (LAMBDA (X Y) (CONS X Y)))
(SETQ EQ (LAMBDA (X Y) (EQ X Y)))
(SETQ HALT (LAMBDA (X) (*HALT X)))

(SETQ CAAR (LAMBDA (X) (CAR (CAR X))))
(SETQ CADR (LAMBDA (X) (CAR (CDR X))))
(SETQ CDAR (LAMBDA (X) (CDR (CAR X))))
(SETQ CDDR (LAMBDA (X) (CDR (CDR X))))
(SETQ CAAAR (LAMBDA (X) (CAR (CAR (CAR X)))))
(SETQ CAADR (LAMBDA (X) (CAR (CAR (CDR X)))))
(SETQ CADAR (LAMBDA (X) (CAR (CDR (CAR X)))))
(SETQ CADDR (LAMBDA (X) (CAR (CDR (CDR X)))))
(SETQ CDAAR (LAMBDA (X) (CDR (CAR (CAR X)))))
(SETQ CDADR (LAMBDA (X) (CDR (CAR (CDR X)))))
(SETQ CDDAR (LAMBDA (X) (CDR (CDR (CAR X)))))
(SETQ CDDDR (LAMBDA (X) (CDR (CDR (CDR X)))))

(SETQ LIST (LAMBDA X X))

(SETQ NULL (LAMBDA (X) (EQ X NIL)))
(SETQ NOT NULL)

(SETQ RPLACA
  (LAMBDA (X Y)
    (COND ((ATOM X)
            (HALT "RPLACA: EXPECTED CONS"))
          (T (*RPLACA X Y)))))

(SETQ RPLACD
  (LAMBDA (X Y)
    (COND ((ATOM X)
            (HALT "RPLACD: EXPECTED CONS"))
          (T (*RPLACD X Y)))))

(SETQ RECONC
  (LAMBDA (A B)
    (COND ((EQ A NIL) B)
          (T (RECONC (CDR A)
                     (CONS (CAR A) B))))))

(SETQ REVERSE
  (LAMBDA (A)
    (RECONC A NIL)))

(SETQ NREVERSE
  (LAMBDA (A)
    (LABEL
      ((NRECONC
         (LAMBDA (A B)
           (COND ((EQ A NIL) B)
                 (T (SETQ *NRTMP (CDR A))
                    (*RPLACD A B)
                    (NRECONC *NRTMP A))))))
      (COND ((EQ A NIL) NIL)
            ((ATOM A)
              (HALT "NREVERSE: EXPECTED LIST"))
            (T (NRECONC A NIL))))))

(SETQ APPEND
  (LAMBDA (A B)
    (RECONC (REVERSE A) B)))

(SETQ NCONC
  (LAMBDA (A B)
    (LABEL
      ((LOOP (LAMBDA (A B)
         (COND ((ATOM (CDR A))
                 (RPLACD A B))
               (T (NCONC (CDR A) B))))))
      (COND ((ATOM A) B)
            (T (LOOP A B)
               A)))))

(SETQ EQUAL
  (LAMBDA (A B)
    (COND ((EQ A B))
          ((ATOM A) NIL)
          ((ATOM B) NIL)
          ((EQUAL (CAR A) (CAR B))
            (EQUAL (CDR A) (CDR B))))))

(SETQ MEMBER
  (LAMBDA (X A)
    (COND ((EQ A NIL) NIL)
          ((EQUAL X (CAR A)) A)
          (T (MEMBER X (CDR A))))))

(SETQ ASSOC
  (LAMBDA (X A)
    (COND ((EQ A NIL) NIL)
          ((EQUAL X (CAAR A)) (CAR A))
          (T (ASSOC X (CDR A))))))

(SETQ MAPCAR
  (LAMBDA (*F *A)
    (LABEL
      ((MAP (LAMBDA (A R)
         (COND ((EQ A NIL) (NREVERSE R))
               (T (MAP (CDR A)
                       (CONS (*F (CAR A)) R)))))))
     (MAP *A NIL))))

(SETQ MAPCAR2
  (LAMBDA (*F *A *B)
    (LABEL
      ((MAP (LAMBDA (A B R)
         (COND ((EQ A NIL) (NREVERSE R))
               ((EQ B NIL) (NREVERSE R))
               (T (MAP (CDR A)
                       (CDR B)
                       (CONS (*F (CAR A) (CAR B))
                             R)))))))
     (MAP *A *B NIL))))

(SETQ REDUCE
  (LAMBDA (*F *B *A)
    (LABEL
      ((RED (LAMBDA (A R)
         (COND ((EQ A NIL) R)
               (T (RED (CDR A)
                       (*F R (CAR A))))))))
      (RED *A *B))))

(SETQ RREDUCE
  (LAMBDA (*F *B *A)
    (LABEL
       ((RED (LAMBDA (A R)
          (COND ((EQ A NIL) R)
                (T (RED (CDR A)
                        (*F (CAR A) R)))))))
       (RED (REVERSE *A) *B))))

(SETQ WRITEC
  (LAMBDA (C)
    (*WRITEC C)))

(SETQ TERPRI
  (LAMBDA ()
    (*WRITEC *NL)))

(SETQ PRIN1
  (LAMBDA (X)
    (LABEL
      ((PRC (LAMBDA (X)
         (COND ((EQ X NIL))
               (T (*WRITEC X)
                  (PRC (*CDR X))))))
       (PR-ATOM (LAMBDA (X)
         (PRC (*CAR X))))
       (PR-MEM (LAMBDA (X)
         (COND ((EQ X NIL))
               ((ATOM X)
                 (PR ". ")
                 (PR X))
               ((EQ (CDR X) NIL)
                 (PR (CAR X)))
               (T (PR (CAR X))
                  (PR " ")
                  (PR-MEM (CDR X))))))
       (PR (LAMBDA (X)
         (COND ((EQ X NIL)
                 (*WRITEC (QUOTE N))
                 (*WRITEC (QUOTE I))
                 (*WRITEC (QUOTE L)))
               ((EQ (*CAR (*CAR X)) *FUNTAG)
                 (PR-ATOM "<FUNCTION>"))
               ((*ATOMP X)
                 (*WRITEC "<")
                 (*WRITEC X)
                 (*WRITEC ">"))
               ((ATOM X)
                 (PR-ATOM X))
               (T (*WRITEC *LP)
                  (PR-MEM X)
                  (*WRITEC *RP))))))
      (PR X)
      X)))

(SETQ PRINT
  (LAMBDA (X)
    (PRIN1 X)
    (TERPRI)
    X))

(SETQ SAMENAMEP
  (LAMBDA (X Y)
    (COND ((EQ X NIL) (EQ Y NIL))
          ((EQ Y NIL) NIL)
          ((EQ (*CAR X) (*CAR Y))
            (SAMENAMEP (*CDR X) (*CDR Y))))))

; (SETQ INTERN
;   (LAMBDA (X)
;     (LABEL
;       ((FIND (LAMBDA (SYML)
;          (COND ((EQ NIL SYML) NIL)
;                ((SAMENAMEP (*CAR X)
;                            (*CAR (CAR SYML)))
;                  (CAR SYML))
;                (T (FIND (CDR SYML)))))))
;       (LABEL ((Y (FIND (CAR *SYMLIS))))
;         (COND (Y)
;               (T (*RPLACA *SYMLIS
;                           (CONS X (CAR *SYMLIS)))
;                  (CAAR *SYMLIS)))))))

(SETQ MKNAME
  (LAMBDA (C A)
    (LABEL ((N (CONS NIL A)))
      (*SETATOM N T)
      (*RPLACA N (*CAR C)))))

(SETQ INTERN
  (LAMBDA (X)
    (LABEL ((FIRST
              (LAMBDA (X)
                (CONS (MKNAME (*CAR X) NIL) NIL)))
            (FIND (LAMBDA (X M A)
              (COND ((EQ A NIL) NIL)
                    ((SAMENAMEP (*CAR X) (*CAR (M A)))
                      (CAR A))
                    (T (FIND X M (CDR A))))))
            (F (FIRST X))
            (B (FIND F CAAR (CAR *SYMLIS))))
      (COND (B (LABEL ((V (FIND X CAR (CDR B))))
                 (COND (V)
                       (T (*RPLACD B (CONS X (CDR B)))
                          X))))
            (T (*RPLACA *SYMLIS
                        (CONS (CONS F (LIST X))
                              (CAR *SYMLIS)))
               X)))))

(SETQ *PEEKED NIL)

(SETQ PEEKC
  (LAMBDA ()
    (COND (*PEEKED)
          (T (SETQ *PEEKED (*READC))
             (COND ((EQ *PEEKED NIL) NIL)
                   (T (SETQ *PEEKED
                            (INTERN (CONS *PEEKED NIL)))
                      *PEEKED))))))

(SETQ READC
  (LAMBDA ()
    (COND (*PEEKED
            (LABEL ((C *PEEKED))
              (SETQ *PEEKED NIL)
              C))
          (T (LABEL ((C (*READC)))
               (COND ((EQ C NIL) NIL)
                     (T (INTERN (CONS C NIL)))))))))

(SETQ MAKESYM
  (LAMBDA (N)
    (LABEL
      ((IMPL (LAMBDA (N A)
         (COND ((EQ N NIL)
                 (CONS A NIL))
               (T (IMPL (CDR N)
                        (MKNAME (*CAR (CAR N))
                                A)))))))
      (IMPL (REVERSE N) NIL))))

(SETQ IMPLODE
  (LAMBDA (X)
    (INTERN (MAKESYM X))))

(SETQ EXPLODE
  (LAMBDA (N)
    (LABEL
      ((MKATOM (LAMBDA (X)
         (INTERN (CONS (MKNAME X NIL) NIL))))
       (EXPL (LAMBDA (N A)
         (COND ((EQ N NIL) (NREVERSE A))
               (T (EXPL (*CDR N)
                        (CONS (MKATOM N) A)))))))
      (COND ((ATOM N) (EXPL (*CAR N) NIL))
            (T (HALT "EXPLODE: EXPECTED ATOM"))))))

(SETQ *SYMBOLS
      (QUOTE (A B C D E F G H I
              J K L M N O P Q R
              S T U V W X Y Z * -
              0 1 2 3 4 5 6 7 8 9)))

(SETQ SYMBOLIC
  (LAMBDA (C)
    (MEMBER C *SYMBOLS)))

(SETQ READ
  (LAMBDA ()
    (LABEL
      ((SKIPC (LAMBDA (C)
         (COND ((EQ " " C)
                 (READC)
                 (SKIPC (PEEKC)))
               ((EQ C *NL)
                 (READC)
                 (SKIPC (PEEKC)))
               (T C))))
       (RD-COMM (LAMBDA (C)
         (COND ((EQ C *NL))
               (T (RD-COMM (READC))))))
       (RD-ATOM (LAMBDA (C A)
         (COND ((SYMBOLIC C)
                 (READC)
                 (RD-ATOM (PEEKC) (CONS C A)))
               (T (COND ((EQUAL A (QUOTE (L I N))) NIL)
                        (T (IMPLODE (NREVERSE A))))))))
       (RD-PSTR (LAMBDA (C A)
         (COND ((EQ C NIL)
                 (HALT "UNTERMINATED STRING"))
               ((EQ C "\"")
                 (READC)
                 (LIST (QUOTE QUOTE) (IMPLODE (NREVERSE A))))
               ((EQ C "\\")
                 (READC)
                 (SETQ C (READC))
                 (RD-PSTR (PEEKC) (CONS C A)))
               (T (READC)
                  (RD-PSTR (PEEKC)
                           (CONS C A))))))
       (RD-LIST (LAMBDA (C A)
         (COND ((EQ C NIL)
                 (HALT "UNTERMINATED LIST"))
               ((EQ *RP C)
                 (READC)
                 (NREVERSE A))
               (T (SETQ *READ-TMP (RD-OBJ (SKIPC (PEEKC))))
                  (RD-LIST (SKIPC (PEEKC))
                           (CONS *READ-TMP A))))))
       (RD-OBJ (LAMBDA (C)
         (COND ((EQ C NIL) NIL)
               ((SYMBOLIC C)
                 (RD-ATOM C NIL))
               ((EQ C *LP)
                 (READC)
                 (RD-LIST (SKIPC (PEEKC)) NIL))
               ((EQ C "'")
                 (READC)
                 (LIST (QUOTE QUOTE) (RD-OBJ (SKIPC (PEEKC)))))
               ((EQ C "\"")
                 (READC)
                 (RD-PSTR (PEEKC) NIL))
               ((EQ C ";")
                 (RD-COMM (READC))
                 (RD-OBJ (SKIPC (PEEKC))))
               ((EQ C *RP)
                 (READC)
                 (RD-OBJ (SKIPC (PEEKC))))
               (T (HALT "FUNNY CHARACTER"))))))
      (RD-OBJ (SKIPC (PEEKC))))))

;;; DO NOT PLACE A *STOP HERE, FILE WILL BE CONCATENATED

