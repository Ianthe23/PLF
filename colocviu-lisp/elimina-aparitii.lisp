(defun elimina(l e)
    (cond
        ((AND (atom l) (not (equal l e))) (list l))
        ((atom l) nil)
        (t (list (mapcan #'(lambda (x) (elimina x e)) l)))
    )
)

(defun main(l e)
    (car (elimina l e))
)

(print (main '(1 (2 A (3 A)) (A)) 'A))