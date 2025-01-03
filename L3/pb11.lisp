; Sa se scrie o functie care sterge toate aparitiile unui atom de la toate
; nivelurile unei liste.

(defun sterge(x e)
    (cond
        ((AND (atom x) (not (equal x e))) x)
        ((equal x e) nil)
        (t (remove nil (mapcar #'(lambda (l) (sterge l e)) x)))
    )
)

(print (sterge '(1 2 3 4 5 6 7 8 9 10) 5))