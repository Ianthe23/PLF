; Definiti o functie care da adancimea unui arbore n-ar reprezentat
; sub forma (radacina lista_noduri_subarb1 ... lista_noduri_subarbN).

(defun adancime(x)
    (cond
        ((atom x) 0)
        (t (+ 1 (apply 'max (mapcar #'adancime x))))
    )
)

(print (adancime '(a (b (c)) (d) (e (f)))))
(print (adancime '(a (b (c)) (d) (e (f)) (g (h (i (j)))))))