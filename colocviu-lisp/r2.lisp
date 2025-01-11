; Se da o lista neliniara. Sa se scrie un porgram LISP
; pt. determinarea numarului de subliste de la orice nivel
; pt care atomul numeric maxim de pe nivelurile impare 
; este par - nivelul superficial al listei este 1, folosind
; MAP. Exemplu: (A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) - 
; are 4 astfel de subliste: (B 2), (1 C 4), (D 2 (6 F)) si ((G 4) 6).

(defun atom_maxim(l maxim)
    (cond
        ((null l) maxim)
        ((AND (numberp (car l)) (>= (car l) maxim)) (atom_maxim (cdr l) (car l)))
        ((atom (car l)) (atom_maxim (cdr l) maxim))
        (t (atom_maxim (cdr l) maxim))
    )
)

(defun nr_subliste(x niv)
    (cond
        ((atom x) 0)
        ((AND (listp x) (= (mod niv 2) 1) (= (mod (atom_maxim x -1) 2) 0)) (+ 1 (apply '+ (mapcar #'(lambda (x) (nr_subliste x (+ niv 1))) x))))
        (t (apply '+ (mapcar #'(lambda (x) (nr_subliste x (+ niv 1))) x)))
    )
)

(print (nr_subliste '(A 3 (B 2) (1 C 4) (D 2 (6 F)) ((G 4) 6)) 0))
