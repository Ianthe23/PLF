; Definiti o functie care obtine dintr-o lista data lista tuturor atomilor
; care apar pe orice nivel, dar in aceeasi ordine. De exemplu:
;; (((A B) C) (D E)) -> (A B C D E)
 
; lista_inordine - functie care returneaza lista tuturor atomilor care apar pe orice nivel, dar in aceeasi ordine
(defun lista_inordine(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((atom (car l)) (cons (car l) (lista_inordine (cdr l)))) ; daca l1 e atom, il inseram in lista si apelam lista_inordine pe restul listei
        (t (append (lista_inordine (car l)) (lista_inordine (cdr l)))) ; altfel, inseram lista_inordine a lui l1 si a lui l2..ln
    )
)

(print (lista_inordine '(((A B) C) (D E))))
(print (lista_inordine '((A (B) (C) D (E F G (H))))))