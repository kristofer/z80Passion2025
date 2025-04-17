;;; LISP to C Compiler
;;; Nils M Holm, 2020
;;;
;;; In the public domain
;;;
;;; Where there is no public domain, the
;;; Creative Commons Zero (CC0) license applies

(define addr '(1 0 0))

(define lbl '(0))

(define nil-addr '(0))
(define t-addr '(1))
(define limit '(6 5 5 3 5))

(define succ
  (lambda (x)
    (cdr (assv x '((0 . 1) (1 . 2) (2 . 3)
                   (3 . 4) (4 . 5) (5 . 6)
                   (6 . 7) (7 . 8) (8 . 9)
                   (9 . 0))))))

(define incr
  (lambda (x)
    (let loop ((x (reverse x)) (c #t) (y '()))
      (cond ((null? x)
              (if c (cons 1 y) y))
            (c
              (let ((d (succ (car x))))
                (loop (cdr x) (eqv? d 0) (cons d y))))
            (else
              (loop (cdr x) #f (cons (car x) y)))))))

(define number
  (lambda (n)
    (if (equal? n '(0))
        0
        (let loop ((n n) (m 0))
          (cond ((null? n) m)
                (else (loop (cdr n) (+ (* m 10) (car n)))))))))

(define cells '())

; (define symlis '((t 1)))

(define symlis (list (list 't '(t 1))))

(define oblist '())

(define make-label
  (lambda ()
    (set! lbl (incr lbl))
    lbl))

(define make-cell
  (lambda (a d t)
    (set! cells (cons (list addr t a d) cells))
    (let ((n addr))
      (set! addr (incr addr))
      n)))

(define make-atom
  (lambda (x)
    (let loop ((x (reverse (string->list (symbol->string x))))
                  (p nil-addr))
      (cond ((null? x)
              (make-cell p nil-addr #f))
            (else
              (loop (cdr x)
                    (make-cell (char-upcase (car x)) p #t)))))))

; (define add-atom
;   (lambda (x)
;     (cond ((assq x symlis) => cdr)
;           (else (set! symlis (cons (cons x (make-atom x)) symlis))
;                 (cdar symlis)))))

(define first
  (lambda (x)
    (string->symbol
      (substring (symbol->string x) 0 1))))

(define add-atom
  (lambda (x)
    (let ((fc (first x)))
      (cond ((assq fc symlis)
              => (lambda (b)
                   (cond ((assq x (cdr b)) => cdr)
                         (else (let ((a (make-atom x)))
                                 (set-cdr! b (cons (cons x a) (cdr b)))
                                 a)))))
            (else (let ((a (make-atom x)))
                    (set! symlis (cons (cons fc (list (cons x a))) symlis))
                    a))))))

(define number->symbol
  (lambda (x)
    (string->symbol
      (number->string x))))

(define locase
  (lambda (x)
    (list->string
      (map char-downcase
           (string->list x)))))

(define make-object
  (lambda (x)
    (cond ((null? x)
            nil-addr)
          ((eq? 'nil x)
            nil-addr)
          ((eq? 't x)
            t-addr)
          ((symbol? x)
            (add-atom x))
          ((string? x)
            (add-atom (string->symbol (locase x))))
          ((integer? x)
            (add-atom (number->symbol x)))
          (else
            (make-cell (make-object (car x))
                       (make-object (cdr x))
                       #f)))))

(define add-object
  (lambda (x)
    (cond ((eq? x 'nil) nil-addr)
          ((eq? x 't) t-addr)
          ((symbol? x)
            (add-atom x))
          (else
            (let ((n (make-object x)))
              (set! oblist (cons n oblist))
              n)))))

(define emit
  (lambda x
    (let loop ((x x))
      (cond ((null? x)
              (newline))
            (else
              (display (car x))
              (loop (cdr x)))))))

(define blockcom
  (lambda (x ta)
     (cond ((null? x))
           ((null? (cdr x))
             (exprcom (car x) ta))
           (else
             (exprcom (car x) #f)
             (blockcom (cdr x) ta)))))

(define condcom
  (lambda (x ta)
    (cond ((null? x)
            (emit "ref(expr) = nil;"))
          ((eq? 't (caar x))
            (cond ((null? (cdar x))
                    (blockcom (car x) ta))
                  (else (blockcom (cdar x) ta))))
          (else
            (exprcom (caar x) #f)
            (emit "if (ref(expr) != nil) {")
            (blockcom (cdar x) ta)
            (emit "} else {")
            (condcom (cdr x) ta)
            (emit "}")))))

(define varsymp
  (lambda (x)
    (cond ((eq? x 'nil) #f)
          ((eq? x 't) #f)
          (else (symbol? x)))))

(define labcom
  (lambda (x)
    (emit "newframe();")
    (let loop ((x (cadr x)))
      (cond ((null? x))
            (else (if (not (varsymp (caar x)))
                      (*halt "LABEL: EXPECTED VARIABLE"))
                  (emit "ref(expr) = cons3("
                        (number (add-atom (caar x)))
                        ", val("
                        (number (add-atom (caar x)))
                        "), 0);")
                 (emit "toframe();")
                 (exprcom (cadar x) #f)
                 (emit "val(" (number (add-atom (caar x)))
                       ") = ref(expr);")
                 (loop (cdr x)))))
    (emit "ref(expr) = nil;")
    (emit "toframe();")
    (blockcom (cddr x) #f)
    (emit "unbind();")
    (emit "pop();")))

(define funcom
  (lambda (x ta)
    (let* ((skip (make-label))
           (fun  (make-label)))
      (emit "goto(" (number skip) ");")
      (emit "label(" (number fun) ");")
      (emit "bind(" (number (add-object (cadr x))) ");")
      (blockcom (cddr x) #t)
      (emit "unbind();")
      (emit "k = retn(); break;")
      (emit "label(" (number skip) ");")
      (emit "ref(expr) = mkfun(" (number fun) ");"))))
;      (emit "ref(expr) = cons3(cons3(funtag, cons3(" (number fun)
;            ", nil, atomtag), atomtag), nil, 0);"))))

(define atomcom
  (lambda (x)
    (exprcom (cadr x) #f)
    (emit "ref(expr) = atomic()? true: nil;")))

(define twoargs
  (lambda (x)
    (exprcom (caddr x) #f)
    (emit "push();")
    (exprcom (cadr x) #f)
    (emit "ref(expr2) = pop();")))

(define eqcom
  (lambda (x)
    (twoargs x)
    (emit "ref(expr) = ref(expr) == ref(expr2)? true: nil;")))

(define funapp
  (lambda (x ta)
    (emit "newframe();")
    (let loop ((a (reverse (cdr x))))
      (cond ((null? a))
            (else
              (exprcom (car a) #f)
              (emit "toframe();")
              (loop (cdr a)))))
    (exprcom (car x) #f)
    (if ta
        (emit "k = apply(-1); break;")
        (let ((ret (make-label)))
          (emit "k = apply(" (number ret) "); break;")
          (emit "label(" (number ret) ");")))))

(define checktag
  (lambda (x)
    (exprcom (cadr x) #f)
    (let ((f (cadr (assq (car x) '((*atomp "atomtag")
                                   (*markp "marktag")
                                   (*travp "travtag"))))))
      (emit "ref(expr) = (tag[ref(expr)] & "
            f ")? true: nil;"))))

(define settag
  (lambda (x)
    (exprcom (cadr x) #f)
    (let ((f (cadr (assq (car x) '((*setatom "atomtag")
                                   (*setmark "marktag")
                                   (*settrav "travtag")))))
          (m (not (eq? (caddr x) 'nil))))
      (emit "tag[ref(expr)]" (if m " |= " " &= ~") f ";"))))

(define exprcom
  (lambda (x ta)
    (cond ((eq? 'nil x)
            (emit "ref(expr) = nil;"))
          ((eq? 't x)
            (emit "ref(expr) = true;"))
          ((eq? '*pool x)
            (emit "ref(expr) = 0;"))
          ((eq? '*limit x)
            (emit "ref(expr) = " (number limit) ";"))
          ((symbol? x)
            (emit "ref(expr) = val(" (number (add-atom x)) ");"))
          ((string? x)
            (emit "ref(expr) = "
                  (number (add-atom (string->symbol (locase x))))
                          ";"))
          ((integer? x)
            (emit "ref(expr) = "
                  (number (add-atom (number->symbol x))) ";"))
          ((eq? 'cond (car x))
            (condcom (cdr x) ta))
          ((eq? 'label (car x))
            (labcom x))
          ((eq? 'lambda (car x))
            (funcom x ta))
          ((eq? 'progn (car x))
            (blockcom (cdr x) ta))
          ((eq? 'quote (car x))
            (emit "ref(expr) = " (number (add-object (cadr x))) ";"))
          ((eq? 'setq (car x))
            (if (not (varsymp (cadr x)))
                (*halt "SETQ: EXPECTED VARIABLE"))
            (exprcom (caddr x) #f)
            (emit "val(" (number (add-atom (cadr x))) ") = ref(expr);"))
          ((eq? 'atom (car x))
            (atomcom x))
          ((eq? 'car (car x))
            (exprcom (cadr x) #f)
            (emit "if (symbolic()) car_err();")
            (emit "ref(expr) = car[ref(expr)];"))
          ((eq? 'cdr (car x))
            (exprcom (cadr x) #f)
            (emit "if (symbolic()) car_err();")
            (emit "ref(expr) = cdr[ref(expr)];"))
          ((eq? 'cons (car x))
            (twoargs x)
            (emit "ref(expr) = cons3(ref(expr), ref(expr2), 0);"))
          ((eq? 'eq (car x))
            (eqcom x))
          ((eq? '*halt (car x))
            (exprcom (cadr x) #f)
            (emit "halt(atomname(ref(expr)), "
                  (number limit) ");"))
          ((memq (car x) '(*atomp *markp *travp))
            (checktag x))
          ((eq? '*car (car x))
            (exprcom (cadr x) #f)
            (emit "ref(expr) = car[ref(expr)];"))
          ((eq? '*cdr (car x))
            (exprcom (cadr x) #f)
            (emit "ref(expr) = cdr[ref(expr)];"))
          ((eq? '*dump (car x))
            (exprcom (cadr x) #f)
            (emit "dump(ref(expr));"))
          ((eq? '*load (car x))
            (exprcom (cadr x) #f)
            (emit "load(ref(expr));"))
          ((eq? '*next (car x))
            (exprcom (cadr x) #f)
            (emit "ref(expr)++;"))
          ((memq (car x) '(*setatom *setmark *settrav))
            (settag x))
          ((eq? '*readc (car x))
            (emit "ref(expr) = readc();"))
          ((eq? '*rplaca (car x))
            (twoargs x)
            (emit "car[ref(expr)] = ref(expr2);"))
          ((eq? '*rplacd (car x))
            (twoargs x)
            (emit "cdr[ref(expr)] = ref(expr2);"))
          ((eq? '*writec (car x))
            (exprcom (cadr x) #f)
            (emit "writec(ref(expr));"))
          ((pair? (car x))
            (funapp x #f))
          (else
            (funapp x ta)))))

(define prolog
  (lambda ()
    (emit "")
    (emit "/******** LISCMP OUTPUT FOLLOWS ********/")
    (emit "")
    (emit "void run(void) {")
    (emit "int k;")
    (emit "setup();")
    (emit "for (k=0;;) switch (k) {")
    (emit "case 0:")))

(define emit-oblist
  (lambda ()
    (let loop ((lp oblist) (lplist nil-addr))
      (cond ((null? lp)
              (emit "ref(oblist) = " (number lplist) ";"))
            (else
              (loop (cdr lp) (make-cell (car lp) lplist #f)))))))

(define init-cells
  (lambda ()
    (let loop ((n cells))
      (cond ((null? n))
            (else
              (let ((x (number (caar n)))
                    (a (if (pair? (caddar n))
                           (number (caddar n))
                           (char->integer (caddar n))))
                    (d (number (cadddr (car n))))
                    (f (if (cadar n) "atomtag" "0")))
                (emit "car[" x "] = " a "; "
                      "cdr[" x "] = " d "; "
                      "tag[" x "] = " f ";")
                (loop (cdr n))))))))

(define epilog
  (lambda ()
    (emit "return;")
    (emit "}}")
    (emit "")
    (emit "void setup(void) {")
;    (emit "ref(symlis) = "
;          (number (make-object (map car symlis))) ";"))
;    (let ((y (fold-right append '() (map cdr symlis))))
;      (emit "ref(symlis) = "
;            (number (make-object (map car y))) ";"))
    (let ((y (map (lambda (x)
                    (cons (car x) (map car (cdr x))))
                  symlis)))  
      (emit "ref(symlis) = "
            (number (make-object y)) ";"))
    (emit-oblist)
    (init-cells)
    (emit "}")))

(define dump-pool
  (lambda ()
    (emit "/******** POOL DUMP FOLLOWS ********")
    (for-each (lambda (x)
                (display (number (car x)))
                (display #\space)
                (display (if (cadr x) "A" "-"))
                (display #\space)
                (display (if (pair? (caddr x))
                         (number (caddr x))
                         (caddr x)))
                (display #\space)
                (display (number (cadddr x)))
                (newline))
              cells)
    (emit "***********************************/")))

(define liscmp
  (lambda ()
    (prolog)
    (let loop ((x (read)))
      (cond ((eof-object? x))
            ((eq? '*stop x))
            (else
              (exprcom x #f)
              (loop (read)))))
    (epilog)
    (dump-pool)))

(liscmp)
