; Definiti o functie care substituie un element cu alt element la toate
; nivelurile unei liste date

(defun inlocuire(x e f)
    (cond
        ((AND (atom x) (not (equal x e))) x)
        ((equal x e) f)
        (t (mapcar #'(lambda (l) (inlocuire l e f)) x))
    )
)

(print (inlocuire '(a (b (c)) (d) (e (f))) 'b 'g))
(print (inlocuire '(1 2 3 4 5 6) 4 10))
(print (inlocuire '(1 2 (4 11) 4 5 6) 4 10))