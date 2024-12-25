; Definiti o functie care intoarce produsul a doi vectori

; produs - functie care calculeaza produsul a doi vectori
; a - lista data
; b - lista data
; output - lista, produsul a doi vectori
(defun produs(a b)
    (cond
        ((AND (null a) (null b)) nil) ; daca ambele liste sunt vide, returneaza nil
        ((null a) (cons (car b) (produs a (cdr b)))) ; daca prima lista e vida, adauga primul element din a doua lista si apeleaza produs pe restul listei
        ((null b) (cons (car a) (produs (cdr a) b))) ; daca a doua lista e vida, adauga primul element din prima lista si apeleaza produs pe restul listei
        (t (cons (* (car a) (car b)) (produs (cdr a) (cdr b)))) ; altfel, adauga produsul primelor elemente si apeleaza produs pe restul listelor
    )
)

(print (produs '(1 2 3) '(4 5 6)))
(print (produs '(1 2 3) '(4 5 6 7)))
(print (produs '(1 2 3 4) '(4 5 6)))
(print (produs '(1 2 3 4) '()))
(print (produs '() '(4 5 6)))
(print (produs '() '()))