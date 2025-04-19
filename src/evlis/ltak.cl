;;; LTAK BENCHMARK, COMMON LISP VERSION

(LET*
  ((SIX (QUOTE (1 2 3 4 5 6)))
   (TWELVE (APPEND SIX SIX))
   (EIGHTEEN (APPEND SIX TWELVE)))
  (LABELS
    ((LTAK (X Y Z)
       (COND ((NOT-LONGER X Y) Z)
             (T (LTAK (LTAK (CDR X) Y Z)
                      (LTAK (CDR Y) Z X)
                      (LTAK (CDR Z) X Y)))))
     (NOT-LONGER (A B)
       (COND ((EQ NIL A))
             ((EQ NIL B) NIL)
             (T (NOT-LONGER (CDR A) (CDR B)))))
     (NTIMES (N)
       (COND ((NULL N))
             (T (PRINT (LTAK EIGHTEEN TWELVE SIX))
                (NTIMES (CDR N))))))
    (NTIMES '(1 2 3 4 5 6 7 8 9 10))))
