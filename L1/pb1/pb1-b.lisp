; Definiti o functie care obtine dintr-o lista data lista tuturor
; atomilor care apar pe orice nivel, dar in ordine inversa. De exemplu:
; (((A B) C) (D E)) -> (E D C B A)

(defun lista_inversa(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((atom (car l)) (append (lista_inversa (cdr l)) (list (car l)))) ; daca l1 e atom, il inseram dupa lista inversa a lui l2..ln
        (t (append (lista_inversa (cdr l)) (lista_inversa (car l)))) ; altfel, inseram lista inversa a lui l1 dupa lista inversa a lui l2..ln
    )
)

(print (lista_inversa '(((A B) C) (D E))))