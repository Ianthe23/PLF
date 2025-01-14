(defun gasit(l e)
    (cond
        ((null l) nil)
        ((AND (atom (car l)) (equal (car l) e)) t)
        ((atom (car l)) (gasit (cdr l) e))
        (t (OR (gasit (car l) e) (gasit (cdr l) e)))
    )
)

(defun inaltime(l nod)
    (cond
        ((atom l) 0)
        ((AND (listp l) (gasit l nod)) (+ 1 (apply '+ (mapcar #'(lambda (x) (inaltime x nod)) l))))
        (t (apply '+ (mapcar #'(lambda (x) (inaltime x nod)) l)))
    )
)

(defun main(l nod)
    (cond
        ((= (inaltime l nod) 0) -1)
        (t (inaltime l nod))
    )
)

(defun g(l)
    (MAPCON #'LIST l)
)

(print (main '(a (b (g)) (c (d (e)) (f))) 'e)) ; 4
(print (main '(a (b (g)) (c (d (e)) (f))) 'h)) ; -1
(print (main '(a (b (g)) (c (d (e)) (f))) 'a)) ; 1
(print (main '(a (b (g)) (c (d (e)) (f))) 'b)) ; 2

(print(APPLY #'APPEND (MAPCON #'G '(1 2))))