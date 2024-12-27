; Sa se construiasca o functie care intoarce numarul de atomi dintr-o
; lista, de la nivel superficial

; nr_atomi: list -> int
; intoarce numarul de atomi dintr-o lista, de la nivel superficial
(defun nr_atomi(l)
    (cond
        ((null l) 0) ; daca lista e vida, returneaza 0
        ((atom (car l)) (+ 1 (nr_atomi (cdr l)))) ; daca primul element e atom, aduna 1 si apeleaza recursiv pentru coada listei
        (t (nr_atomi (cdr l))) ; altfel, apeleaza recursiv pentru coada listei
    )
)

(print (nr_atomi '(1 2 3 4 5)))
(print (nr_atomi '(1 2 3 (5 6) 4 5)))
(print (nr_atomi '(1 2 3 (5 6) 4 5 (7 8 (11 12) 9 10))))
(print (nr_atomi '()))
(print (nr_atomi '((1 2) (3 4))))