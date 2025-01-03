; Definiti o functie care substituie un element E prin elementele unei alte liste L
; la toate nivelurile unei liste X.

(defun substituie_lista(x e l)
    (cond
        ((AND (atom x) (not (equal x e))) x)
        ((equal x e) l)
        (t (mapcar #'(lambda (k) (substituie_lista k e l)) x))
    )
)

(print (substituie_lista '(1 2 3 4 5 6 7 8 9 10) 5 '(a b c d e f g h i j)))
(print (substituie_lista '(1 2 (3 4) 5 (2 3) 7 8 9 10) 5 '(a b c d e f g h i j)))
(print (substituie_lista '(1 2 (3 4) 5 (2 3) 7 8 9 10) 2 '(a b c d e f g h i j)))