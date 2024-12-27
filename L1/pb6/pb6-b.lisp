; Sa se scrie o functie care realizeaza o lista de asociere cu cele
; doua liste pe care le primeste. De ex. pentru listele (a b c) si
; (x y z) se produce ((a.x) (b.y) (c.z)).

; asociere: list list -> list
; realizeaza o lista de asociere cu cele doua liste primite
(defun asociere (a b)
    (cond
        ((AND (null a) (null b)) nil) ; daca ambele liste sunt vide, returneaza nil

        ; daca prima lista e vida, adauga elementul curent din b si a
        ((null a) (cons (car b) (asociere a (cdr b))))

        ; daca a doua lista e vida, adauga elementul curent din a si b
        ((null b) (cons (car a) (asociere (cdr a) b)))

        ; altfel, adauga elementul curent din a si b
        (t (append (list (cons (car a) (car b))) (asociere (cdr a) (cdr b))))

    )
)

(print (asociere '(a b c) '(x y z)))
(print (asociere '(a b c d) '(x y z)))
(print (asociere '(a b c) '(x y z w)))