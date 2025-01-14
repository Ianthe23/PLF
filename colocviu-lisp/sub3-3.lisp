(defun inlocuie(l niv k)
    (cond
        ((AND (atom l) (= niv k)) 0)
        ((atom l) l)
        (t (mapcar #'(lambda (x) (inlocuie x (+ niv 1) k)) l))
    )
)
(print (inlocuie '(a (1 (2 b)) (c (d))) 0 2))