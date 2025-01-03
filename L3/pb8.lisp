; Sa se contruiasca o functie care intoarce maximul atomilor numerici
; dintr-o lista, la orice nivel.

(defun maxim(x)
    (cond
        ((numberp x) x)
        ((atom x) -1)
        (t (apply 'max (mapcar #'maxim x)))
    )
)

(print (maxim '(1 2 3 4)))
(print (maxim '(1 2 (10 11) 3 4)))
(print (maxim '(1 2 (10 11) 3 4 100)))