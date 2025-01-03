; Sa se construiasca o functie care determina adancimea unei liste.

(defun adancime(x)
    (cond
        ((atom x) 0)
        (t (+ 1 (apply 'max (mapcar #'adancime x))))
    )
)

(print (adancime '(1 2 3 4 5 6 7 8 9 10)))
(print (adancime '(1 2 (3 4) 5 (2 3) 7 8 9 10)))
(print (adancime '(1 2 (3 4) 5 (2 (7 7) 3) 7 8 9 10)))