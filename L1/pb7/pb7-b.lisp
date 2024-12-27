; Definiti o functie care substituie prima aparitie a unui element
; intr-o lista data

(defun substituie(l e k)
    (cond
        ((null l) nil)
        ((equal (car l) e) (cons k (cdr l)))
        (t (cons (car l) (substituie (cdr l) e k)))
    )
)

(print (substituie '(1 2 3 4 5 3) 3 '(1 1 1))) 