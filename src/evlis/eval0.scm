;;; Meta-circular interpreter
;;; Nils M Holm, 2019, 2020
;;;
;;; In the public domain
;;; (CC0 applies when there is no public domain)
;;;
;;; Based on John McCarthy's Micro Manual for LISP,
;;; HOPL II proceedings, 1978

(define-syntax label
  (syntax-rules ()
    ((label ((n f) ...) x)
     (letrec ((n f) ...) x))))

(define (print x)
  (write x)
  (newline))

(define atom symbol?)

(define t (quote t))

(define nil (quote ()))

(define eq eq?)

(define evsrc '(lambda (x e)

(label
  ((lookup
     (lambda (x e)
       (cond ((eq nil e) nil)
             ((eq x (caar e))
               (cadar e))
             (t (lookup x (cdr e))))))

   (evcon
     (lambda (c e)
       (cond ((xeval (caar c) e)
               (xeval (cadar c) e))
             (t (evcon (cdr c) e)))))

   (bind
     (lambda (v a e)
       (cond ((eq v nil) e)
             (t (cons (cons (car v)
                            (cons (xeval (car a) e)
                                  nil))
                      (bind (cdr v) (cdr a) e))))))

   (append2
     (lambda (a b)
       (cond ((eq a nil) b)
             (t (cons (car a) (append2 (cdr a) b))))))

   (xeval
     (lambda (x e)
       (cond ((eq x t) t)
             ((atom x)
                (lookup x e))
             ((atom (car x))
               (cond ((eq (car x) (quote quote))
                       (cadr x))
                     ((eq (car x) (quote atom))
                       (atom (xeval (cadr x) e)))
                     ((eq (car x) (quote eq))
                       (eq (xeval (cadr x) e)
                           (xeval (caddr x) e)))
                     ((eq (car x) (quote car))
                       (car (xeval (cadr x) e)))
                     ((eq (car x) (quote cdr))
                       (cdr (xeval (cadr x) e)))
                     ((eq (car x) (quote caar))
                       (caar (xeval (cadr x) e)))
                     ((eq (car x) (quote cadr))
                       (cadr (xeval (cadr x) e)))
                     ((eq (car x) (quote cdar))
                       (cdar (xeval (cadr x) e)))
                     ((eq (car x) (quote cadar))
                       (cadar (xeval (cadr x) e)))
                     ((eq (car x) (quote caddr))
                       (caddr (xeval (cadr x) e)))
                     ((eq (car x) (quote cons))
                       (cons (xeval (cadr x) e)
                             (xeval (caddr x) e)))
                     ((eq (car x) (quote cond))
                       (evcon (cdr x) e))
                     ((eq (car x) (quote label))
                       (xeval (caddr x)
                              (append2 (cadr x) e)))
                     ((eq (car x) nil)
                       '*undefined)
                     ((eq (car x) (quote lambda))
                       x)
                     (t (xeval (cons (xeval (car x) e)
                                     (cdr x))
                               e))))
             ((eq (caar x) (quote lambda))
               (xeval (cadr (cdar x))
                      (bind (cadar x) (cdr x) e)))))))

  (xeval x e))))

(define xeval (eval evsrc))

(define expr (quote
               (label
                 ((append
                   (lambda (a b)
                     (cond ((eq a nil) b)
                           (t (cons (car a)
                                    (append (cdr a)
                                             b)))))))
                 (append (quote (a b c))
                         (quote (d e f))))))

(print (xeval expr nil))

(print (xeval `(,evsrc ',expr nil) nil))
