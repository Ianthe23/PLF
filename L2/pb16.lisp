; Sa se decida daca un arbore este echilibrat sau nu.

; nr_nivele - functie care primeste ca parametri un arbore si un nivel si returneaza numarul de nivele al arborelui
; l - arborele lista de tipul 2
; nivele - numarul de nivele, integer
; output - numarul de nivele al arborelui
(defun nr_nivele(l nivele)
    (cond
        ((null l) nivele) ; daca lista e vida, returneaza numarul de nivele
        (t (max (nr_nivele (cadr l) (+ nivele 1)) (nr_nivele (caddr l) (+ nivele 1)))) ; altfel, returneaza maximul dintre numarul de nivele al subarborelui stang si numarul de nivele al subarborelui drept
    )
)

; echilibrat - functie care primeste ca parametru un arbore si returneaza daca arborele este echilibrat sau nu
; l - arborele lista de tipul 2
; output - true daca arborele este echilibrat, false altfel
(defun echilibrat(l)
    (cond
        ((null l) t) ; daca lista e vida, returnam true
        ((= (abs (- (nr_nivele (cadr l) 0) (nr_nivele (caddr l) 0))) 1) t) ; daca diferenta dintre numarul de nivele al subarborelui stang si numarul de nivele al subarborelui drept este 1, returnam true
        (t nil) ; altfel, returnam false
    )
)

(print (echilibrat '(1 (2 (4 () (7)) ()) (3 (5) (6)))))
(print (echilibrat '(1 (2) (3 (4 () (5)) ()))))