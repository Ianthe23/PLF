; Definiti o functie care testeaza apartenenta unui nod intr-un 
; arbore n-ar, reprezentat sub forma (radacina lista_noduri_subarb1 
; lista_noduri_subarb2 ... lista_noduri_subarbN).

(defun nod(x e)
    (cond
        ((AND (atom x) (not (equal x e))) 0)
        ((equal x e) 1)
        (t (apply '+ (mapcar #'(lambda (l) (nod l e)) x)))
    )
)

(defun main(x e)
    (cond
        ((= (nod x e) 0) (print "Fals"))
        (t (print "Adevarat"))
    )
)

(main '(a (b (c)) (d) (e (f))) 'f)
(main '(a (b (c)) (d) (e (f))) 'g)