; Sa se construiasca lista nodurilor unui arbore de tipul (a (b) (c (d) (e)))
; parcurs in postordine

; postordine - functie care primeste ca parametru un arbore si returneaza lista nodurilor arborelui parcurse in postordine
; l - arborele lista de tipul 2
; output - lista nodurilor arborelui parcurse in postordine
(defun postordine(l)
    (cond
        ((null l) nil) ; daca lista e nula, returneaza nil
        (t (append (postordine (cadr l)) (postordine (caddr l)) (list (car l)))) ; altfel, returneaza concatenarea postordinei subarborelui stang, postordinea subarborelui drept si radacina
    )
)

(print (postordine '(1 (2 (4 () (7)) ()) (3 (5) (6)))))