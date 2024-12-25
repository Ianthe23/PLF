; Sa se insereze intr-o lista liniara un atom a dat dupa al 2-lea, al 4-lea, al 6-lea, ... , element.

(defun insereaza(lista x index)
    (cond
        ((null lista) nil) ; daca lista e vida, returneaza nil
        ((= (mod index 2) 0) (cons (car lista) (cons x (insereaza (cdr lista) x (+ index 1))))) ; daca index e par, insereaza x pe langa l1 in lista
        (t (cons (car lista) (insereaza (cdr lista) x (+ index 1)))) ; altfel, insereaza doar l1 in lista
    )
)

(print (insereaza '(1 2 3 4 5 6 7 8 9 10) 0 1))
(print (insereaza '(1 2 3 4 5 6 7) 0 1))
(print (insereaza '(1 2) 0 1))
(print (insereaza '(1) 0 1))
(print (insereaza '() 0 1))