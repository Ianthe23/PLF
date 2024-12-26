; Se da un arbore de tipul (a (b) (c (d) (e))).
; Sa se precizeze nivelul pe care se afla un nod x dat in arbore.
; Nivelul radacinii este 0.


; nivel - functie care primeste ca parametri un arbore si un nod si returneaza nivelul pe care se afla nodul in arbore
; l - arborele lista de tipul 2
; x - nodul de tipul 1, atom
; nivel - nivelul pe care se afla nodul in arbore, integer
; output - nivelul pe care se afla nodul in arbore sau NIL daca nodul nu se afla in arbore
(defun nivel(l x nivel)
    (cond
        ((null l) nil) ; daca lista e nula, returneaza nil
        ((equal (car l) x) nivel) ; daca nodul curent e nodul cautat, returneaza nivelul
        (t (OR (nivel (cadr l) x (+ nivel 1)) (nivel (caddr l) x (+ nivel 1)))) ; altfel, returneaza nivelul nodului cautat in subarborele stang sau drept
    )
)

(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 7 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 3 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 1 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 6 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 2 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 5 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 4 0))
(print (nivel '(1 (2 (4 () (7)) ()) (3 (5) (6))) 10 0))