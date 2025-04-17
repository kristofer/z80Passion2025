;;; META-CIRCULAR INTERPRETER
;;; NILS M HOLM, 2019, 2020
;;;
;;; IN THE PUBLIC DOMAIN
;;; (CC0 APPLIES WHEN THERE IS NO PUBLIC DOMAIN)
;;;
;;; BASED ON JOHN MCCARTHY'S MICRO MANUAL FOR LISP,
;;; HOPL II PROCEEDINGS, 1978

(DEFMACRO LABEL (B X)
  `(LABELS
     ,(MAPCAR
        (LAMBDA (A) 
          (LET ((F (CADR A)))
            `(,(CAR A) ,(CADR F) ,(CADDR F))))
        B)
     ,X)) 

(LABEL
  ((LOOKUP
     (LAMBDA (X E)
       (COND ((EQ NIL E) NIL)
             ((EQ X (CAAR E))
               (CADAR E))
             (T (LOOKUP X (CDR E))))))

   (EVCON
     (LAMBDA (C E)
       (COND ((XEVAL (CAAR C) E)
               (XEVAL (CADAR C) E))
             (T (EVCON (CDR C) E)))))

   (BIND
     (LAMBDA (V A E)
       (COND ((EQ V NIL) E)
             (T (CONS (CONS (CAR V)
                            (CONS (XEVAL (CAR A) E)
                                  NIL))
                      (BIND (CDR V) (CDR A) E))))))

   (APPEND2
     (LAMBDA (A B)
       (COND ((EQ A NIL) B)
             (T (CONS (CAR A) (APPEND2 (CDR A) B))))))

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
                     ((EQ (CAR X) (QUOTE LABEL))
                       (XEVAL (CADDR X)
                              (APPEND2 (CADR X) E)))
                     ((EQ NIL (CAR X))
                       (QUOTE *UNDEFINED))
                     ((EQ (CAR X) (QUOTE LAMBDA))
                       X)
                     (T (XEVAL (CONS (XEVAL (CAR X) E)
                                     (CDR X))
                               E))))
             ((EQ (CAAR X) (QUOTE LAMBDA))
               (XEVAL (CADR (CDAR X))
                      (BIND (CADAR X) (CDR X) E)))))))

  (XEVAL (QUOTE
           (LABEL
             ((APPEND
               (LAMBDA (A B)
                 (COND ((EQ A NIL) B)
                       (T (CONS (CAR A)
                                (APPEND (CDR A)
                                         B)))))))
             (APPEND (QUOTE (A B C))
                     (QUOTE (D E F)))))
         NIL))
