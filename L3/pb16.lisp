; Definiti o functie care inverseaza o lista impreuna cu toate sublistele
; sale de pe orice nivel

(defun inverseaza(x)
    (cond
        ((atom x) x)
        (t (reverse (mapcar #'inverseaza x)))
    )
)

(print (inverseaza '(1 2 3 4 5 6 7 8 9 10)))
(print (inverseaza '(1 2 3 4 (1 2) 6 7 8 9 10)))
(print (inverseaza '(a (b (c)) (d) (e (f)))))