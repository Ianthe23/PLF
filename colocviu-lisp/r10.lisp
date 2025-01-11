; Se da o lista neliniara. Sa se scrie un program LISP
; pt. determinarea nr de subliste de la orice nivel pt care
; ultimul atom numeric de la orice nivel este impar, folosind MAP.
; Exemplu: (A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) - are 0 astfel
; de subliste.

(defun ultim_atom(l ant)
    (cond
        ((null l) ant)
        ((numberp (car l)) (ultim_atom (cdr l) (car l)))
        ((atom (car l)) (ultim_atom (cdr l) ant))
    )
)

(defun lista_numere(l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (cons (car l) (lista_numere (cdr l))))
        ((atom (car l)) (lista_numere (cdr l)))
        (t (append (lista_numere (car l)) (lista_numere (cdr l))))
    )
)

(defun nr_subliste(x)
    (cond
        ((atom x) 0)
        ((= (mod (ultim_atom (lista_numere x) nil) 2) 1) (+ 1 (apply '+ (mapcar #'nr_subliste x))))
        (t (apply '+ (mapcar #'nr_subliste x)))
    )
)

(print (ultim_atom (lista_numere '(A 3 (B 20) (1 C 4) (D 2 (6 F)) ((G 4) 7))) nil))
(print (nr_subliste '(A 3 (B 20) (1 C 5) (D 2 (6 F)) ((G 4) 7))))