; Definiti o functie care determina numarul nodurilor de pe
; nivelul k dintr-un arbore n-ar reprezentat sub forma (radacina
; (subarbore1) (subarbore2) ... (subarbore-n)).

(defun nr_noduri(x k niv)
    (cond
        ((AND (atom x) (= (- niv 1) k)) 1)
        ((atom x) 0)
        (t (apply '+ (mapcar #'(lambda (l) (nr_noduri l k (+ niv 1))) x)))
    )
)

(print (nr_noduri '(1 (2 (4)) (5) (3 (6))) 2 0))