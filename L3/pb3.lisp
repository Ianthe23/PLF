; Sa se construiasca o functie care verifica daca un atom e membru
; al unei liste nu neaparat liniare.

(defun membru(x e)
    (cond
        ((AND (atom x) (not (equal x e))) 0)
        ((equal x e) 1)
        (t (apply '+ (mapcar #'(lambda (l) (membru l e)) x)))
    )
)

(defun main(x e)
    (cond
        ((= (membru x e) 0) (print "Nu e membru"))
        (t (print "E membru"))
    )
)

(main '(1 2 3 4 5 6 7 8 9 10) 11)
(main '(1 2 3 4 5 6 7 8 9 10) 10)