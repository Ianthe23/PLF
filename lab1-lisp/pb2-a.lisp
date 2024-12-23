;;definiti o functie care selecteaza al n-lea element dintr-o lista
;;sau NIL daca nu exista


;; select - functie care selecteaza al n-lea element dintr-o lista
;; n - numarul elementului pe care vrem sa il selectam
;; l - lista din care vrem sa selectam elementul
(defun select(n l)
    (cond 
          ((null l) nil) ;;daca lista e vida, atunci returnez nil
          ((< n 1) nil) ;; daca n < 1, returnez nil 
          ((= n 1) (car l)) ;; daca n = 1, atunci returnez primul element din lista
          ((> n 1) (select (- n 1) (cdr l))) ;; daca n > 1, continui cu restul listei
    )
)

(print (select 3 '(1 2 3 4 5 6 7 8 9 10)))
(print (select 6 '(1 2 3 4)))
(print (select 1 '(1 2 3)))
(print (select 0 '(1 2 3)))
(print (select 4 '()))