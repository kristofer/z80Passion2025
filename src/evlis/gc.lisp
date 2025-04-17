;;; CONS / GC ALGORITHM IN LISP
;;; USING DEUTSCH/SCHORR/WAITE GRAPH MARKER
;;;
;;; NILS M HOLM, 2020
;;;
;;; IN THE PUBLIC DOMAIN
;;;
;;; WHERE THERE IS NO PUBLIC DOMAIN, THE
;;; CREATIVE COMMONS ZERO (CC0) LICENSE APPLIES

(SETQ MARK
  (LAMBDA (N)
    (LABEL
      ((P NIL)  ; PARENT
       (X NIL)  ; TEMPORARY
       (LOOP (LAMBDA (N)
         (COND
           ((*MARKP N)
             (COND
               ((EQ NIL P))
               ((*TRAVP P)
                  (SETQ X (*CDR P))
                  (*RPLACD P (*CAR P))
                  (*RPLACA P N)
                  (*SETTRAV P NIL)
                  (LOOP X))
               (T (SETQ X P)
                  (SETQ P (*CDR X))
                  (*RPLACD X N)
                  (LOOP X))))
           ((*ATOMP N)
              (SETQ X (*CDR N))
              (*RPLACD N P)
              (SETQ P N)
              (*SETMARK P T)
              (LOOP X))
           (T (SETQ X (*CAR N))
              (*RPLACA N P)
              (SETQ P N)
              (*SETMARK P T)
              (*SETTRAV P T)
              (LOOP X))))))
      (LOOP N))))

(SETQ *FRELIS
  (*NEXT (*NEXT (*NEXT (*NEXT
    (*NEXT (*NEXT (*NEXT (*NEXT
      (*NEXT (*NEXT *POOL)))))))))))

(SETQ *ROOTLIM (*NEXT *FRELIS))

(SETQ GC
  (LAMBDA ()
    (LABEL
      ((MARK-ROOTS
        (LAMDBA (N)
          (COND ((EQ N *ROOTLIM))
                (T (MARK N)
                   (MARK-ROOTS (*NEXT N))))))
       (COLLECT-FREE
         (LAMBDA (N)
           (COND ((EQ N *LIMIT))
                 ((*MARKP N)
                    (*SETMARK N NIL)
                    (COLLECT-FREE (*NEXT N)))
                 (T (*RPLACD N (*CAR *FRELIS))
                    (*RPLACA *FREELIS N)
                    (COLLECT-FREE (*NEXT N)))))))
      (*RPLACA *FRELIS NIL)
      (MARK-ROOTS *POOL)
      (COLLECT-FREE *ROOTLIM)))))

(SETQ CONS3
  (LAMBDA (A D AT)
    (COND ((EQ NIL (*CAR *FRELIS))
            (GC)
            (COND ((EQ NIL (*CAR *FRELIS)))
                    (*HALT "OUT OF CELLS"))))
    (LABEL ((N (*CAR *FRELIS)))
      (COND (AT (*SETATOM N T))
            (T  (*SETATOM N NIL)))
      (*RPLACA *FRELIS (*CDR (*CAR *FRELIS))))
      (*RPLACA N A)
      (*RPLACD N D)))

(SETQ CONS 
  (LAMBDA (A D)
    (CONS3 A D NIL)))
