; Sa se converteasca un arbore de tipul 2 la un arbore de tipul 1

; convertire - functie care primeste ca parametru un arbore si returneaza arborele de tipul 1
; l - arborele lista de tipul 2
; output - arborele de tipul 1
(defun convertire(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil

        ; daca subarborele stang si subarborele drept sunt nevide, returneaza o lista cu nodul curent si 2, apoi subarborele stang si subarborele drept convertite
        ((AND (not (null (cadr l))) (not (null (caddr l)))) (append (list (car l) 2) (convertire (cadr l)) (convertire (caddr l))))

        ; daca subarborele stang sau subarborele drept sunt nevide, returneaza o lista cu nodul curent si 1, apoi subarborele stang si subarborele drept convertite
        ((OR (not (null (cadr l))) (not (null (caddr l)))) (append (list (car l) 1) (convertire (cadr l)) (convertire (caddr l))))

        ; altfel, returneaza o lista cu nodul curent si 0
        (t (append (list (car l) 0) (convertire (cadr l)) (convertire (caddr l))))
    )
)

(print (convertire '(1 (2 (4 () (7)) ()) (3 (5) (6)))))
(print (convertire '(A (B) (C (D) (E)))))
(print (convertire '(1 (2) (3 (4 () (5)) ()))))