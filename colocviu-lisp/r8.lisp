; Se da o lista neliniara. Sa se scrie un program LISP pt
; determinarea nr-ului de subliste de la orice nivel pt care
; nr atomilor numerici de la orice nivel este impare, folosind
; MAP. Exemplu: (A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) -
; are 3 astfel de subliste: (B 2), (6 F), (G 4).

(defun nr_atomnum(l)
    (cond
        ((null l) 0)
        ((numberp (car l)) (+ 1 (nr_atomnum (cdr l))))
        ((atom (car l)) (nr_atomnum (cdr l)))
        (t (+ (nr_atomnum (car l)) (nr_atomnum (cdr l))))
    )
)

(defun nr_subliste(x)
    (cond
        ((atom x) 0)
        ((= (mod (nr_atomnum x) 2) 1) (+ 1 (apply '+ (mapcar #'nr_subliste x))))
        (t (apply '+ (mapcar #'nr_subliste x)))
    )
)

(print (nr_subliste '(A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6))))