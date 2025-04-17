;;; LEXICALLY SCOPED INTERPRETER
;;; NILS M HOLM, 2019, 2020
;;;
;;; IN THE PUBLIC DOMAIN
;;; (CC0 APPLIES WHEN THERE IS NO PUBLIC DOMAIN)
;;;
;;; VERY LOOSELY BASED ON JOHN MCCARTHY'S MICRO MANUAL FOR LISP,
;;; HOPL II PROCEEDINGS, 1978

(LABEL
  ((LOOKUP
     (LAMBDA (X E)
       (COND ((EQ NIL E) NILL)
             ((EQ X (CAAR E))
               (CADAR E))
             (T (LOOKUP X (CDR E))))))

   (EVCON
     (LAMBDA (C E)
       (COND ((XEVAL (CAAR C) E)
               (XEVAL (CADAR C) E))
             (T (EVCON (CDR C) E)))))

   (BIND
     (LAMBDA (V A E CE)
       (COND ((EQ V NIL) E)
             (T (CONS (LIST (CAR V) (XEVAL (CAR A) CE))
                      (BIND (CDR V) (CDR A) E CE))))))

   (EVLAB
     (LAMBDA (B XS E)
       (LABEL ((VS (MAPCAR CAR B))
               (AS (MAPCAR CADR B))
               (NS (MAPCAR (LAMBDA (X) NIL) VS))
               (SETUP (LAMBDA (VS AS)
                 (COND ((NULL VS) NIL)
                       (T (CONS (LIST (QUOTE SETQ)
                                      (CAR VS)
                                      (CAR AS))
                                (SETUP (CDR VS) (CDR AS))))))))
         (XEVAL (APPEND (LIST (APPEND (LIST (QUOTE LAMBDA))
                                      (APPEND (LIST VS)
                                              (APPEND (SETUP VS AS)
                                                      XS))))
                        NS) E))))

   (EVLIS
     (LAMBDA (XS E)
       (COND ((NULL (CDR XS)) (XEVAL (CAR XS) E))
             (T (XEVAL (CAR XS) E)
                (EVLIS (CDR XS) E)))))

   (EVSET
     (LAMBDA (X E)
       (RPLACA (CDR (ASSOC (CAR X) E))
               (XEVAL (CADR X) E))))

   (XPRIN1
     (LAMBDA (X)
       (COND ((ATOM X) (PRIN1 X) (PRIN1 " "))
             ((EQ (QUOTE *CLOSURE) (CAR X)) (PRIN1 "<CLOSURE> "))
             (T (PRIN1 "(")
                (MAPCAR XPRIN1 X)
                (PRIN1 ")")))))
   (XPRINT
     (LAMBDA (X)
       (XPRIN1 X)
       (TERPRI)
       X))

   (XEVAL
     (LAMBDA (X E)
       (COND ((EQ X T) T)
             ((ATOM X)
                (LOOKUP X E))
             ((ATOM (CAR X))
               (COND ((EQ (CAR X) (QUOTE QUOTE))
                       (CADR X))
                     ((EQ (CAR X) (QUOTE ATOM))
                       (ATOM (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE EQ))
                       (EQ (XEVAL (CADR X) E)
                           (XEVAL (CADR (CDR X)) E)))
                     ((EQ (CAR X) (QUOTE CAR))
                       (CAR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CDR))
                       (CDR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CAAR))
                       (CAAR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CADR))
                       (CADR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CDAR))
                       (CDAR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CADAR))
                       (CADAR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CADDR))
                       (CADDR (XEVAL (CADR X) E)))
                     ((EQ (CAR X) (QUOTE CONS))
                       (CONS (XEVAL (CADR X) E)
                             (XEVAL (CADDR X) E)))
                     ((EQ (CAR X) (QUOTE COND))
                       (EVCON (CDR X) E))
                     ((EQ (CAR X) (QUOTE SETQ))
                       (EVSET (CDR X) E))
                     ((EQ (CAR X) (QUOTE LABEL))
                       (EVLAB (CADR X) (CDDR X) E))
                     ((EQ NIL (CAR X))
                       (QUOTE *UNDEFINED))
                     ((EQ (CAR X) (QUOTE LAMBDA))
                       (APPEND (LIST (QUOTE *CLOSURE)
                                     (CADR X)
                                     E)
                               (CDDR X)))
                     (T (XEVAL (CONS (XEVAL (CAR X) E)
                                     (CDR X))
                               E))))
             ((EQ (CAAR X) (QUOTE *CLOSURE))
               (EVLIS (CDDR (CDAR X))
                      (BIND (CADAR X)
                            (CDR X)
                            (CADR (CDAR X))
                            E)))
             (T (XEVAL (CONS (XEVAL (CAR X) E)
                             (CDR X))
                       E)))))

   ;; DOWNWARD FUNARG PROBLEM, EXPECTED: (X X X)
   (EXPR1 (QUOTE
            (LABEL
              ((MAPLIST (LAMBDA (F X)
                 (COND ((EQ X NIL) NIL)
                       (T (CONS (F X)
                                (MAPLIST F (CDR X))))))))
              ((LAMBDA (X)
                 (MAPLIST (LAMBDA (Y) X)
                          (QUOTE (A B C))))
               (QUOTE X)))))

   ;; UPWARD FUNARG PROBLEM, EXPECTED: (FOO . BAR)
   (EXPR2 (QUOTE
            (LABEL
              ((CONSER
                (LAMBDA (X)
                  (LAMBDA (Y)
                    (CONS X Y)))))
              ((CONSER (QUOTE FOO))
               (QUOTE BAR))))))

  (LIST (XEVAL EXPR1 NIL)
        (XEVAL EXPR2 NIL)))

*STOP
