; Se da o lista neliniara. Sa se scrie un program LISP pt
; determinarea numarului de subliste de la orice nivel
; pt care atomul numeric minim de pe nivelurile impare
; este par - nivelul superficial al listei este 1, folosind
; MAP. Exemplu: (A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) -
; are 3 astfel de subliste: (B 2), (D 2 (6 F)) si ((G 4) 6).


(defun atom_minim(l minim)
    (cond
        ((null l) minim)
        ((AND (numberp (car l)) (<= (car l) minim)) (atom_minim (cdr l) (car l)))
        (t (atom_minim (cdr l) minim))
    )
)

(defun nr_subliste(x niv)
    (cond
        ((atom x) 0)
        ((AND (listp x) (= (mod niv 2) 1) (= (mod (atom_minim x 1000000) 2) 0)) (+ 1 (apply '+ (mapcar #'(lambda (x) (nr_subliste x (+ niv 1))) x))))
        (t (apply '+ (mapcar #'(lambda (x) (nr_subliste x (+ niv 1))) x)))
    )
)

(print (nr_subliste '(A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) 0))