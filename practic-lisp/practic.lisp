; cmmdc (a: number b:number) - intoarce cmmdc-ul dintre 2 numere
; model de flux (i,i)
; OUTPUT: cmmdc dintre cele 2 numere
(defun cmmdc(a b)
    (cond
        ((= b 0) a)
        (t (cmmdc b (mod a b)))
    )
)

; lista_atominumerici(l: list) - intoarce o lista liniara formata din atomi numerici dintr-o lista neliniara
; model de flux(i)
; OUTPUT: lista liniara formata din atomi numerici
(defun lista_atominumerici(l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (cons (car l) (lista_atominumerici (cdr l))))
        ((atom (car l)) (lista_atominumerici (cdr l)))
        (t (append (lista_atominumerici (car l)) (lista_atominumerici (cdr l))))
    )
)

; cmmmc(l: list nr: number) - intoarce cmmmc-ul dintr-o lista liniara cu atomi numerici
; model de flux (i i)
; OUTPUT: nr -> cmmmc-ul din lista data
(defun cmmmc(l nr)
    (cond
        ((null l) nr)
        (t (cmmmc (cdr l) (floor (* (car l) nr) (cmmdc (car l) nr))))
    )
)

; main(l: list) - intoarce cmmmc-ul dintr-o lista neliniara
; model de flux (i)
; OUTPUT: cmmmc-ul listei date
(defun main(l)
    (cmmmc (lista_atominumerici l) 1)
)

(print (main '(12 (2 A B) 4 6 (8 A C))))
(print (main '(3 (A (B (C 6)) 12 36 (72 X Y)))))
(print (main '(A (B (C (D 2) 5)))))
(print (main '(1 2 3 4)))
(print (main '(1 1 1 1)))
(print (main '(A B C D E)))
(print "---")

(print (main '(12 2 4 6 8)))
(print (main '(4 10 (5 6) 2)))
(print (main '(1 A (2 3 B 6) 5)))
(print (main '(1 (2 (3 (4 (F) 5) 6) 1) 1)))