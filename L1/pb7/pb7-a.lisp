; Sa se testeze daca o lista data este liniara

; este_liniara: list -> bool
; testeaza daca o lista data este liniara
(defun este_liniara(l)
    (cond
        ((null l) t) ; daca lista e vida, returneaza t
        ((atom (car l)) (este_liniara (cdr l))) ; daca primul element e atom, trecem mai departe
        (t nil) ; daca primul element e lista, returnam false
    )
)

(print (este_liniara '(1 2 3 4 5))) ; t
(print (este_liniara '(1 2 (3 4) 5))) ; nil