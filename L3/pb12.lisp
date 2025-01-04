; Definiti o functie care inlocuieste un nod cu altul intr-un arbore
; n-ar reprezentat sub forma (radacina lista_noduri_subarb1 ... lista_noduri_subarbN).

(defun inlocuire(x e f)
    (cond
        ((AND (atom x) (not (equal x e))) x)
        ((equal x e) f)
        (t (mapcar #'(lambda (l) (inlocuire l e f)) x))
    )
)

(print (inlocuire '(a (b (c)) (d) (e (f))) 'b 'g))
(print (inlocuire '(a (b (c)) (d) (e (f))) 'h 'g))