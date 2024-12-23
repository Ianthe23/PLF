;;sa se construiasca o functie care verifica daca un atom e mem
;;al unei liste nu neaparat liniara


;; verifica - functie care verifica daca un element e membru al unei liste
;; e - elementul pe care vrem sa il verificam
;; l - lista in care vrem sa verificam daca e element
(defun verifica(e l)
    (cond
        ((null l) nil) ;; daca lista e vida, returnez nil
        ((equal e (car l)) t) ;; daca e egal cu primul element, returnez true
        ((atom (car l)) (verifica e (cdr l))) ;; daca e atom, verificam in restul listei
        ((listp (car l)) (verifica e (car l))) ;; daca e lista, verificam in lista
        ((listp (car l)) (verifica e (cdr l))) ;; daca e lista, verificam in restul listei
    )
)

(print (verifica 3 '(1 2 3 4)))
(print (verifica 3 '(1 2 (3 4))))
(print (verifica 3 '(1 (2 (3 4)) 5)))
(print (verifica 3 '(1 2 4 5)))