; Sa se contruiasca o functie care intoarce suma atomilor numerici
; dintr-o lista, la orice nivel.

(defun suma(x)
    (cond
        ((numberp x) x)
        ((atom x) 0)
        (t (apply '+ (mapcar #'suma x)))
    )
)

(print (suma '(1 2 3 4)))
(print (suma '(1 2 (3 4) 5)))