; Succesorul unui numar scris sub reprezentare de lista

; succesor: list, int -> list
; calculeaza succesorul unui numar scris sub reprezentare de lista
(defun succesor(l r)
    (cond
        ((AND (null l) (= r 1)) '(1)) ; daca lista e vida si r e 1, returneaza (1)
        ((null l) nil) ; daca lista e vida, returneaza nil
        (t (cons (mod (+ (car l) r) 10) (succesor (cdr l) (floor (+ (car l) r) 10)))) ; altfel, adauga ultima cifra a sumei dintre primul element si r la rezultat si apeleaza recursiv pentru coada listei
    )
)

; ultima_cifra: list, int -> int
; intoarce ultima cifra a unui numar scris sub reprezentare de lista
(defun ultima_cifra(l nr)
    (cond
        ((null l) nr) ; daca lista e vida, intoarce nr
        (t (ultima_cifra (cdr l) (car l))) ; altfel, apeleaza recursiv pentru coada listei
    )
)

; succesorMain: list -> list
; calculeaza succesorul unui numar scris sub reprezentare de lista
(defun succesorMain(l)
    (reverse (succesor (reverse l) 1)) ; apeleaza succesor pentru lista inversata si 1
)

(print (succesorMain '(1 2 3 4 5))) ; (1 2 3 4 6)
(print (succesorMain '(1 2 3 4 9))) ; (1 2 3 5 0)
(print (succesorMain '(9 9 9)))