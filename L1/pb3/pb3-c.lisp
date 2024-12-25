; Definiti o functie care sorteaza fara pastrarea dublurilor o lista liniara.

; divide1 - functie care imparte lista in 2
; l - lista data
; output - lista rezultata
(defun divide1(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((= (length l) 1) (list (car l))) ; daca lista are un singur element, returneaza lista cu acel element
        (t (cons (car l) (divide1 (cddr l)))) ; altfel, adauga primul element si apeleaza divide1 pe restul listei de la l3 incolo
    )
)

; divide2 - functie care imparte lista in 2
; l - lista data
; output - lista rezultata
(defun divide2(l)
    (cond
        ((OR (null l) (= (length l) 1)) nil) ; daca lista e vida sau are un singur element, returneaza nil
        (t (cons (cadr l) (divide2 (cddr l)))) ; altfel, adauga al doilea element si apeleaza divide2 pe restul listei de la l3 incolo
    )
)

; interclasa - functie care interclaseaza 2 liste
; l1 - prima lista
; l2 - a doua lista
; output - lista rezultata
(defun interclasa(l1 l2)
    (cond
        ((null l1) l2)
        ((null l2) l1)
        ((< (car l1) (car l2)) (cons (car l1) (interclasa (cdr l1) l2)))
        ((< (car l2) (car l1)) (cons (car l2) (interclasa l1 (cdr l2))))
        (t (interclasa (cdr l1) l2))
    )
)

; merge_sort - functie care sorteaza o lista
; l - lista data
; output - lista sortata
(defun merge_sort(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((= (length l) 1) (list (car l))) ; daca lista are un singur element, returneaza lista cu acel element
        (t (interclasa (merge_sort (divide1 l)) (merge_sort (divide2 l)))) ; altfel, interclaseaza lista rezultata din divide1 cu lista rezultata din divide2
    )
)

(print (merge_sort '(1 2 3 2 7 6 5 10)))
(print (merge_sort '(2 1)))
(print (merge_sort '(1)))
(print (merge_sort '()))
(print (merge_sort '(3 3 3 2 2 2 1 2 2)))