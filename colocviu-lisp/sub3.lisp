(defun f(x &rest y)
    (cond
        ((null y) x)
        (t (append x (mapcar #'CAR y)))
    )
)

(defun G(L)
    (MAPCON #'LIST L)
)

(print (APPEND (F '(1 2)) (F '(3 4) '(5 6) '(7 8))))
(print (APPLY #'APPEND (MAPCON #'G '(1 2))))