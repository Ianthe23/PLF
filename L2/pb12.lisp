; Sa se construiasca lista nodurilor unui arbore de tipul (a (b) (c (d) (e)))
; parcurs in preordine


; preordine - functie care primeste ca parametru un arbore si returneaza lista nodurilor arborelui parcurse in preordine
; l - arborele lista de tipul 2
; output - lista nodurilor arborelui parcurse in preordine
(defun preordine(l)
    (cond
        ((null l) nil) ; daca lista e nula, returneaza nil
        (t (append (list (car l)) (preordine (cadr l)) (preordine (caddr l)))) ; altfel, returneaza concatenarea radacinii, preordinea subarborelui stang si preordinea subarborelui drept
    )
)

(print (preordine '(1 (2 (4 () (7)) ()) (3 (5) (6)))))