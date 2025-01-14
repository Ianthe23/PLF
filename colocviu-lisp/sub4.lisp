(defun inlocuie(l)
    (cond
        ((AND (numberp l) (= (mod l 2) 0)) (+ l 1))
        ((atom l) l)
        (t (mapcar #'inlocuie l))
    )
)

(print (inlocuie '(1 s 4 (2 f (7)))))