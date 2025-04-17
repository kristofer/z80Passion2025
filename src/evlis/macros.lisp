;;; MACRO EXAMPLES
;;; ONLY WORK WITH LISINT/M

;; QUOTE MACRO

(MACRO Q
  (LAMBDA (X)
    (LIST (QUOTE QUOTE) (CAR X))))

; (Q (FOO BAR BAZ))

;; QUOTED LIST MACRO, RECURSIVE VERSION

(MACRO LISTQ
  (LAMBDA (A)
    (COND ((NULL A) NIL)
          (T (LIST (QUOTE CONS)
                   (LIST (QUOTE QUOTE)
                         (CAR A))
                   (CONS (QUOTE LISTQ) (CDR A)))))))

;; QUOTED LIST MACRO, MAPCAR VERSION

(MACRO LISTQ
  (LAMBDA (A)
    (CONS (QUOTE LIST)
          (MAPCAR (LAMBDA (X)
                     (LIST (QUOTE QUOTE) X))
                  A))))

; (LISTQ FOO BAR BAZ)

;; LET FORM

(MACRO LET
  (LAMBDA (A)
    (LABEL ((VS (MAPCAR CAR (CAR A)))
            (AS (MAPCAR CADR (CAR A))))
      (APPEND
        (LIST (APPEND
                (LIST (QUOTE LAMBDA) VS)
                (CDR A)))
        AS))))

; (LET ((A (QUOTE 1)) (B (QUOTE 2))) (LIST A B))

;; NESTED LET (LABEL, LET*) FORM

(MACRO LETN
  (LAMBDA (A)
    (COND ((NULL (CAR A))
		  ; DISABLE TCO
            (LIST (APPEND (QUOTE (LAMBDA ()))
                          (CDR A))))
          (T (LIST (QUOTE LET)
                   (LIST (CAAR A))
                   (APPEND
                     (LIST (QUOTE LETN)
                           (CDAR A))
                     (CDR A)))))))

; (LETN ((A (QUOTE 1)) (B A) (C B)) C)

; (LETN ((F (LAMBDA (X) (COND ((NULL X)) ((G X)))))
;        (G (LAMBDA (X) (F (CDR X)))))
;   (F (QUOTE (1 2 3 4 5))))

*STOP
