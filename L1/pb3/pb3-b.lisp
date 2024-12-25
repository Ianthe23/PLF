; Sa se construiasca o functie care intoarce adancimea unei liste

; adancime - functie care calculeaza adancimea unei liste
; lista - lista data
; h - integer, adancimea listei
(defun adancime(lista h)
    (cond
        ((null lista) h) ; daca lista e vida, returnam adancimea
        ((atom (car lista)) (adancime (cdr lista) h)) ; daca primul element e atom, nu facem nimic
        (t (max (adancime (car lista) (+ h 1)) (adancime (cdr lista) h))) ; altfel, adancimea e maximul dintre adancimea primului element si adancimea restului listei
    )
)

; main - functie care apeleaza functia de adancime cu lista si 1
; lista - lista data
(defun main (lista) 
    (adancime lista 1) ; apelam functia de adancime cu lista si 1
)

(print (main '(1 2 3 4)))
(print (main '(1 2 (3 4 (5 6 7) (3 9) (11 (12 13))))))