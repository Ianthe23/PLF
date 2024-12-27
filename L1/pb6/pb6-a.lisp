; Sa se scrie de doua ori elementul de pe pozitia a n-a a unei liste
; liniare. De ex. pentru (10 20 30 40 50) si n=3 se produce
;(10 20 30 30 40 50).

; dublare: list, int -> list
; dubleaza elementul de pe pozitia n din lista l
(defun dublare (l n)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil

        ; daca n e 1, adauga elementul curent de 2 ori
        ((= n 1) (cons (car l) (cons (car l) (dublare (cdr l) (- n 1)))))
        
        ; altfel, adauga elementul curent o singura data
        (t (cons (car l) (dublare (cdr l) (- n 1))))
    )
)

(print (dublare '(10 20 30 40 50) 3)) ; (10 20 30 30 40 50)
(print (dublare '(10 20 30 40 50) 2)) ; (10 20 20 30 40 50)
(print (dublare '(10 20 30 40 50) 1)) ; (10 10 20 30 40 50)
(print (dublare '(10 20 30 40 50) 6)) ; (10 20 30 40 50)
(print (dublare '(10 20 30 40 50) 0)) ; (10 20 30 40 50)