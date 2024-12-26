; Se da un arbore de tipul 2. Sa se afiseze calea de la radacina pana la
; nodul x dat.

; exista - functie care primeste ca parametri un arbore si un nod si returneaza daca nodul exista in arbore
; l - arborele lista de tipul 2
; x - nodul de tipul 1, atom
; output - daca nodul exista in arbore sau nu
(defun exista (l x)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((AND (atom (car l)) (equal (car l) x)) t) ; daca nodul curent e cel cautat, returnez true
        ((atom (car l)) (exista (cdr l) x)) ; daca nodul curent e atom, caut in lista urmatoare
        (t (OR (exista (car l) x) (exista (cdr l) x))) ; altfel, caut lista curenta si in lista ramasa
    )
)

; cale - functie care primeste ca parametri un arbore si un nod si returneaza calea de la radacina pana la nodul dat
; l - arborele lista de tipul 2
; x - nodul de tipul 1, atom
; output - calea de la radacina pana la nodul dat
(defun cale (l x)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((equal (car l) x) (list x)) ; daca nodul curent e cel cautat, returnez o lista cu acel nod
        ((exista (cadr l) x) (cons (car l) (cale (cadr l) x))) ; daca nodul exista in subarborele stang, adaug radacina la calea subarborelui stang
        ((exista (caddr l) x) (cons (car l) (cale (caddr l) x))) ; daca nodul exista in subarborele drept, adaug radacina la calea subarborelui drept
        (t nil) ; altfel, returnez nil
    )
)

(print (cale '(1 (2 (4 () (7)) ()) (3 (5) (6))) 10))