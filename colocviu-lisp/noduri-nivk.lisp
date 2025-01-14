(defun lista_noduri(l k niv)
    (cond
        ((AND (atom l) (= k niv)) (list l))
        ((atom l) nil)
        (t (mapcan #'(lambda (x) (lista_noduri x k (+ niv 1))) l))
    )
)

(defun main(l k)
    (lista_noduri l k -1)
)

(print (main '(a (b (g)) (c (d (e)) (f))) 2))
(print (main '(a (b (g)) (c (d (e)) (f))) 5))