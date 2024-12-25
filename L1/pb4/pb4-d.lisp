; Sa se construiasca o functie care intoarce maximul atomilor numerici 
; dintr-o lista, de la nivelul superficial

; maxim - functie care calculeaza maximul atomilor numerici dintr-o lista
; l - lista data
; output - integer, maximul atomilor numerici
(defun maxim(l)
    (cond
        ((null l) -10000) ; daca lista e vida, returnam -10000
        ((numberp (car l)) (max (car l) (maxim (cdr l)))) ; daca primul element e numar, returnam maximul dintre primul element si restul listei
        (t (maxim (cdr l))) ; altfel, apelam maxim pe restul listei
    )
)

(print (maxim '(1 2 3 4 5 6 7 8 9 10)))
(print (maxim '(1 2 3 2 1)))
(print (maxim '(1 1 1)))
(print (maxim '(1 2 3 (4 10 A) A B C 8)))