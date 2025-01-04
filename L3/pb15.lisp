; Sa se construiasca o functie care intoarce numarul atomilor dintr-o
; lista, de la orice nivel.

(defun nr_atomi(x)
    (cond
        ((atom x) 1)
        (t (apply '+ (mapcar #'nr_atomi x)))
    )
)

(print (nr_atomi '(1 2 3 4 (1 2) 6 7 8 9 10)))
(print (nr_atomi '(1 2 3 4 (1 2) 6 7 8 9 10 (1 2 3 4 5 6 7 8 9 10))))