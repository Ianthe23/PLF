; Sa se elimine elementul de pe pozitia a n-a a unei liste liniare.

; eliminare: list, int, int -> list
; elimina elementul de pe pozitia n din lista l
(defun eliminare (l n index)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((= n index) (eliminare (cdr l) n (+ index 1))) ; daca n e index, trecem mai departe
        (t (cons (car l) (eliminare (cdr l) n (+ index 1)))) ; altfel, adauga elementul curent la rezultat si apeleaza recursiv pentru coada listei
    )
)

(print (eliminare '(10 20 30 40 50) 3 1)) ; (10 20 40 50)