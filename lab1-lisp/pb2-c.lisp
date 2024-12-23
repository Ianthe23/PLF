;;sa se construiasca lista tuturor sublistelor unei liste. Prin sublista
;;se intelege fie lista insasi, fie un element de pe orice nivel, care este lista
;;ex: (sublista '(1 2 (3 4))) -> ( (1 2 (3 4)) (3 4) )

;; sublista - functie care primeste o lista si returneaza o lista cu toate subliste
;; l - lista pe care o parcurgem
(defun sublista(l)
    (cond
        ((null l) nil) ; daca lista e vida, returnez nil
        ((listp (car l)) (append (cons (car l) (sublista (car l))) (sublista (cdr l))))
        ; daca primul element e lista, adaug lista in lista de subliste si continui cu restul listei
        (t (sublista (cdr l)))
        ; altfel continui cu restul listei
    )
)


;; main - functie care primeste o lista si returneaza o lista cu toate subliste
;; l - lista pe care o parcurgem
(defun main(l)
    (cons l (sublista l)) ;; adaug lista in lista de subliste
)

(print (main '(1 2 3 4)))
(print (main '(1 2 (3 4))))
(print (main '(1 2 (3 (4 5) 6) (7 8) 9)))