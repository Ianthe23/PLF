; Sa se construiasca o functie care intoarce produsul atomilor
; numerici dintr-o lista, de la orice nivel.

(defun produs(x)
    (cond
        ((numberp x) x)
        ((atom x) 1)
        (t (apply '* (mapcar #'produs x)))
    )
)

(print (produs '(1 2 3 4)))
(print (produs '(1 2 (10) 3 4)))