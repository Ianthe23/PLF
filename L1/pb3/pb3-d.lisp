; Sa se scrie o functie care intoarce intersectia a doua multimi.

; intersectie - functie care calculeaza intersectia a doua multimi
; l1 - lista data
; l2 - lista data
; output - lista, intersectia a doua multimi
(defun intersectie(l1 l2)
    (cond
        ((OR (null l1) (null l2)) nil) ; daca una dintre liste e vida, returneaza nil
        ((< (car l1) (car l2)) (intersectie (cdr l1) l2)) ; daca primul element din l1 e mai mic decat primul element din l2, apelam intersectie pe restul lui l1 si l2
        ((< (car l2) (car l1)) (intersectie l1 (cdr l2))) ; daca primul element din l2 e mai mic decat primul element din l1, apelam intersectie pe l1 si restul lui l2
        (t (cons (car l1) (intersectie (cdr l1) (cdr l2)))) ; altfel, adaugam primul element la intersectie si apelam intersectie pe restul lui l1 si l2
    )
)

(print (intersectie '(1 2 3 4 5) '(3 4 5 6 7)))
(print (intersectie '(1 2 3 4 5) '(6 7 8 9 10)))
(print (intersectie '(1 2 3 4 5) '()))
(print (intersectie '() '(1 2 3 4 5)))
(print (intersectie '() '()))