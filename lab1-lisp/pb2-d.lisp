;;sa se scrie o functie care transforma o lista liniara intr-o multime


;; eliminare - functie care elimina un element dintr-o lista
;; e - elementul pe care vrem sa il eliminam
;; l - lista din care vrem sa eliminam elementul
(defun eliminare(e l)
    (cond
        ((null l) nil) ;; daca lista e vida, returnez nil
        ((equal e (car l)) (eliminare e (cdr l))) ;; daca e egal cu primul element, elimin elementul
        (t (cons (car l) (eliminare e (cdr l)))) ;; altfel, adaug elementul in lista rezultat si continui cu restul listei
    )
)


;; multime - functie care transforma o lista liniara intr-o multime
;; l - lista pe care o transformam in multime
(defun multime(l)
    (cond
        ((null l) nil) ;; daca lista e vida, returnez nil
        (t (cons (car l) (multime (eliminare (car l) (cdr l))))) ;; adaug primul element in lista rezultat si 
                                                                 ;; continui cu restul listei fara elementul curent
    )
)

(print (multime '(1 2 2 3 4 5 5)))
(print (multime '(1 2 3 4 5)))
(print (multime '(1 1 1 1 1 )))
(print (multime '()))