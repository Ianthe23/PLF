; Se da o lista neliniara. Sa se scrie un program LISP
; pt determinarea nr. de subliste de la orice nivel pt
; care cel mai mare element numeric de la orice nivel este
; par, folosind MAP. Exemplu: (A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) -
; are 7 astfel de subliste: lista, (B 2), (1 C 4), (D 2 (6 F)), (6 F), ((G 4) 6)
; si (G 4).

(defun nr_maxim(l maxim)
    (cond
        ((null l) maxim)
        ((AND (numberp (car l)) (>= (car l) maxim)) (nr_maxim (cdr l) (car l)))
        ((atom (car l)) (nr_maxim (cdr l) maxim))
        (t (max (nr_maxim (car l) maxim) (nr_maxim (cdr l) maxim)))
    )
)

(defun nr_subliste(x)
    (cond
        ((atom x) 0)
        ((AND (listp x) (= (mod (nr_maxim x -1) 2) 0)) (+ 1 (apply '+ (mapcar #'nr_subliste x))))
        (t (apply '+ (mapcar #'nr_subliste x)))
    )
)

(defun elimina(x niv)
    (cond
        ((numberp x) (list x))
        ((AND (atom x) (= (mod niv 2) 1)) (list x))
        ((atom x) nil)
        (t (list (mapcan #'(lambda (x) (elimina x (+ niv 1))) x)))
    )
)

(defun main(x)
    (car (elimina x 0))
)

(print (nr_subliste '(A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6))))
(print (main '(A (1 (2 B)) (C (D)))))