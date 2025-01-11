; Se da o lista neliniara. Sa se scrie un program LISP
; pentru determinarea numarului de subliste de la orice
; nivel pentru care primul atom numeric la orice nivel
; este numar par, folosind functie MAP.
; Exemplu: (A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) are
; 5 astfel de subliste: (B 2), (1 C 4), (D 2 (6 F)), (G 4) si
; ((G 4) 6).

(defun returneaza_primnumeric(l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (list (car l)))
        ((atom (car l)) (returneaza_primnumeric (cdr l)))
        (t (append (returneaza_primnumeric (car l)) (returneaza_primnumeric (cdr l))))
    )
)

(defun nr_subliste(x)
    (cond
        ((atom x) 0)
        ((AND (listp x) (= (mod (car (returneaza_primnumeric x)) 2) 0)) (+ 1 (apply '+ (mapcar #'nr_subliste x))))
        (t (apply '+ (mapcar #'nr_subliste x)))
    )
)


(print (nr_subliste '(A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)))) 



