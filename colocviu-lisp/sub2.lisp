(defun elimina(l niv e)
    (cond
        ((AND (atom l) (= (mod niv 2) 1)) e)
        ((atom l) l)
        (t (mapcar #'(lambda (x) (elimina x (+ niv 1) e)) l))
    )
)

(print (elimina '(a (b (g)) (c (d (e)) (f))) -1 'h))