; Definiti o functie care substituie un element E prin elementele
; unei liste L1 la toate nivelurile unei liste L.

; inlocuie - functie care inlocuieste un element cu o lista
; l - lista data
; e - elementul de inlocuit
; l1 - lista cu care inlocuim elementul
; output - lista rezultata
(defun inlocuie(l e l1)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((AND (atom (car l)) (equal (car l) e)) (append l1 (inlocuie (cdr l) e l1))) ; daca l1 e atom si e e elementul de inlocuit, adauga l1 si apeleaza inlocuie pe restul listei
        ((atom (car l)) (cons (car l) (inlocuie (cdr l) e l1))) ; daca l1 e atom, adauga l1 si apeleaza inlocuie pe restul listei
        (t (cons (inlocuie (car l) e l1) (inlocuie (cdr l) e l1))) ; altfel, apeleaza inlocuie pe l1 si pe l2..ln
    )
)

(print (inlocuie '(a b c (d (0 f) g 2 i)) 'c '(x y z)))
(print (inlocuie '(a b c (d (e f) g h i)) 'e '(x y z)))