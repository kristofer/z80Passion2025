;;; TRANSLATION OF THE LISP 1 EVALUATOR
;;; FROM THE LISP 1 PROGRAMMER'S MANUAL
;;;
;;; NILS M HOLM, 2020
;;;
;;; IN THE PUBLIC DOMAIN
;;;
;;; WHERE THERE IS NO PUBLIC DOMAIN, THE
;;; CREATIVE COMMONS ZERO (CC0) LICENSE APPLIES

(SETQ EVCON (LAMBDA (X E)
  (COND ((NULL X) NIL)
        ((EVAL (CAAR X) E)
          (EVAL (CADAR X) E))
        (T (EVCON (CDR X) E)))))

(SETQ EVLIS (LAMBDA (X E)
  (COND ((NULL X) NIL)
        (T (CONS (EVAL (CAR X) E)
                 (EVLIS (CDR X) E))))))

(SETQ PAIR (LAMBDA (X Y)
  (MAPCAR2 LIST X Y)))

(SETQ EVAL (LAMBDA (X E)
  (COND ((ATOM X) (CADR (ASSOC X E)))
        ((ATOM (CAR X))
           (COND ((EQ (CAR X) (QUOTE QUOTE))
                   (CADR X))
                 ((EQ (CAR X) (QUOTE ATOM))
                   (ATOM (EVAL (CADR X) E)))
                 ((EQ (CAR X) (QUOTE EQ))
                   (EQ (EVAL (CADR X) E)
                       (EVAL (CADDR X) E)))
                 ((EQ (CAR X) (QUOTE COND))
                   (EVCON (CDR X) E))
                 ((EQ (CAR X) (QUOTE CAR))
                   (CAR (EVAL (CADR X) E)))
                 ((EQ (CAR X) (QUOTE CDR))
                   (CDR (EVAL (CADR X) E)))
                 ((EQ (CAR X) (QUOTE CONS))
                   (CONS (EVAL (CADR X) E)
                         (EVAL (CADDR X) E)))
                 (T (EVAL (CONS (CADR (ASSOC (CAR X) E))
                                (CDR X))
                          E))))
        ((EQ (CAAR X) (QUOTE LABEL))
          (EVAL (CONS (CADDR (CAR X)) (CDR X))
                (CONS (LIST (CADAR X) (CAR X)) E)))
        ((EQ (CAAR X) (QUOTE LAMBDA))
          (EVAL (CADDR (CAR X))
                (APPEND (PAIR (CADAR X)
                              (EVLIS (CDR X) E))
                        E))))))

(EVAL (QUOTE ((LABEL APPEND
                (LAMBDA (A B)
                  (COND ((EQ NIL A) B)
                        (T (CONS (CAR A)
                                 (APPEND (CDR A) B))))))
              (QUOTE (A B C))
              (QUOTE (D E F))))
      (QUOTE ((T T))))

*STOP
