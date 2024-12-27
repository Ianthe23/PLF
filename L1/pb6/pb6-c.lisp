; Sa se determine numarul tuturor sublistelor unei liste date, pe orice
; nivel. Prin sublista se intelege fie lista insasi, fie un element de 
; pe orice nivel, care este lista.

; nr_subliste: list -> int
; determina numarul tuturor sublistelor unei liste date, pe orice nivel
(defun nr_subliste(l)
    (cond
        ((null l) 0) ; daca lista e vida, returneaza 0
        ((atom (car l)) (nr_subliste (cdr l))) ; daca primul element e atom, ignora-l
        (t (+ 1 (nr_subliste (car l)) (nr_subliste (cdr l)))) ; altfel, aduna 1 si apeleaza recursiv pentru capul si coada listei
    )
)

; nr_sublisteMain: list -> int
; determina numarul tuturor sublistelor unei liste date, pe orice nivel
(defun nr_sublisteMain(l)
    (+ 1 (nr_subliste l)) ; aduna 1 pentru lista insasi
)

(print (nr_sublisteMain '(1 2 3 4 5))) ; 1
(print (nr_sublisteMain '(1 2 (3 (4 5) (6 7)) 8 (9 10)))) ; 5
(print (nr_sublisteMain '(1 2 (3 (4 5) (6 7)) 8 (9 10) (11 12 13 14 15)))) ; 6
(print (nr_sublisteMain '()))