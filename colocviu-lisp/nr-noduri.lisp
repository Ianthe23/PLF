(defun nr_noduri(l k niv)
    (cond
        ((AND (atom l) (= k niv)) 1)
        ((atom l) 0)
        (t (apply '+ (mapcar #'(lambda (x) (nr_noduri x k (+ niv 1))) l)))
    )
)

(defun main(l k)
    (nr_noduri l k -1)
)

(print (main '(a (b (g)) (c (d (e)) (f))) 2))