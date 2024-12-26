; Sa se construiasca lista nodurilor unui arbore de tipul (a (b) (c (d) (e)))
; parcurs in inordine


; inordine - functie care primeste ca parametru un arbore si returneaza lista nodurilor arborelui parcurse in inordine
; l - arborele lista de tipul 2
; output - lista nodurilor arborelui parcurse in inordine
(defun inordine(l)
    (cond
        ((null l) nil) ; daca lista e nula, returneaza nil
        (t (append (inordine (cadr l)) (list (car l)) (inordine (caddr l)))) ; altfel, returneaza concatenarea inordinei subarborelui stang, radacina si inordinea subarborelui drept
    )
)

(print (inordine '(1 (2 (4 () (7)) ()) (3 (5) (6)))))