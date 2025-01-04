; Sa se scrie o functie care calculeaza suma numerelor pare minus
; suma numerelor impare de la orice nivel al listei.

(defun suma_pare_impare(x)
    (cond
        ((AND (atom x) (= (mod x 2) 0)) x)
        ((atom x) (* -1 x))
        (t (apply '+ (mapcar #'suma_pare_impare x)))
    )
)

(print (suma_pare_impare '(1 2 3 4 5 6 7 8 9 10)))
(print (suma_pare_impare '(1 2 (3 4) (5 6 7 (8 9)))))