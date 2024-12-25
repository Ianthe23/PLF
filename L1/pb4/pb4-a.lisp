; Definiti o functie care intoarce suma a doi vectori

; suma - functie care calculeaza suma a doi vectori
; a - lista data
; b - lista data
; output - lista, suma a doi vectori
(defun suma(a b)
    (cond
        ((AND (null a) (null b)) nil) ; daca ambele liste sunt vide, returneaza nil
        ((null a) (cons (car b) (suma a (cdr b)))) ; daca prima lista e vida, adauga primul element din a doua lista si apeleaza suma pe restul listei
        ((null b) (cons (car a) (suma (cdr a) b))) ; daca a doua lista e vida, adauga primul element din prima lista si apeleaza suma pe restul listei
        (t (cons (+ (car a) (car b)) (suma (cdr a) (cdr b)))) ; altfel, adauga suma primelor elemente si apeleaza suma pe restul listelor
    )
)

(print (suma '(1 2 3) '(4 5 6)))
(print (suma '(1 2 3) '(4 5 6 7)))
(print (suma '(1 2 3 4) '(4 5 6)))
(print (suma '(1 2 3 4) '()))
(print (suma '() '(4 5 6)))
(print (suma '() '()))