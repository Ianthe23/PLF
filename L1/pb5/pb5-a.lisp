; Definiti o functie care interclaseaza cu pastrarea dublurilor
; 2 liste liniare sortate

; interclasa - functie care interclaseaza 2 liste
; l1 - prima lista
; l2 - a doua lista
; output - lista rezultata
(defun interclasa(l1 l2)
    (cond
        ((null l1) l2) ; daca prima lista e vida, returneaza a doua lista
        ((null l2) l1) ; daca a doua lista e vida, returneaza prima lista
        ((<= (car l1) (car l2)) (cons (car l1) (interclasa (cdr l1) l2))) ; daca primul element din prima lista e mai mic sau egal cu primul element din a doua lista, adauga primul element din prima lista si apeleaza interclasa pe restul primei liste si a doua lista
        ((< (car l2) (car l1)) (cons (car l2) (interclasa l1 (cdr l2)))) ; daca primul element din a doua lista e mai mic decat primul element din prima lista, adauga primul element din a doua lista si apeleaza interclasa pe prima lista si restul a doua lista
    )
)

(print (interclasa '(1 2 3 4 5) '(3 4 5 6 7)))
(print (interclasa '(1 2 3 4 5) '(6 7 8 9 10)))
(print (interclasa '(1 2 3 4 5) '()))
(print (interclasa '() '(1 2 3 4 5)))
(print (interclasa '() '()))