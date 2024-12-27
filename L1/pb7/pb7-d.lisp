; Definiti o functie care interclaseaza fara pastrarea dublurilor doua
; liste liniare sortate

(defun interclasare (a b)
    (cond
        ((AND (null a) (null b)) nil)
        ((null a) b)
        ((null b) a)
        ((< (car a) (car b)) (cons (car a) (interclasare (cdr a) b)))
        ((< (car b) (car a)) (cons (car b) (interclasare a (cdr b))))
        (t (interclasare (cdr a) b))
    )
)

(print (interclasare '(1 2 3 4 5) '(1 3 5 7 9)))
(print (interclasare '(1 2 3 4 5) '(4 5 6 7 8)))