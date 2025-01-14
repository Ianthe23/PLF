(defun cauta(l nod)
    (cond
        ((null l) nil)
        ((AND (atom (car l)) (equal (car l) nod)) t)
        ((atom (car l)) (cauta (cdr l) nod))
        (t (OR (cauta (car l) nod) (cauta (cdr l) nod)))
    )
)

(defun cale(l nod)
    (cond
        ((AND (atom l) (equal l nod)) l)
        ((atom l) nil)
        ((AND (listp l) (cauta l nod)) (append (list (car l)) (mapcan #'(lambda (x) (cale x nod)) l)))
        (t (mapcan #'(lambda (x) (cale x nod)) l))
    )
)

(print (cale '(a (b (g)) (c (d (e)) (f))) 'e)) ; (a c d e)