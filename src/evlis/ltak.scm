;;; LTAK benchmark, SCHEME version

(let* ((six (quote (1 2 3 4 5 6)))
       (twelve (append six six))
       (eighteen (append six twelve)))
  (letrec
    ((ltak (lambda (x y z)
       (if (not-longer x y)
           z
           (ltak (ltak (cdr x) y z)
                 (ltak (cdr y) z x)
                 (ltak (cdr z) x y)))))
     (not-longer (lambda (a b)
       (if (eq? a '())
           #t
           (if (eq? b '())
               #f
               (not-longer (cdr a) (cdr b))))))
     (ntimes (lambda (n)
       (cond ((null? n))
             (else
               (display (ltak eighteen twelve six))
               (newline)
               (ntimes (cdr n)))))))
    (ntimes '(1 2 3 4 5 6 7 8 9 10))))
