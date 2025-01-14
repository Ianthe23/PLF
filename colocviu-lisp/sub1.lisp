(defun elimina(l)
    (cond
        ((AND (numberp l) (= (mod l 3) 0)) nil)
        ((atom l) (list l))
        (t (list (mapcan #'elimina l)))
    )
)

(defun main (l)
    (car (elimina l))
)

(print (main '(1 (2 A (3 A)) (6))))
(print (main '(1 (2 (C)))))