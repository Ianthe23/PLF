; 2. Definiti o functie care obtine dintr-o lista data lista tuturor
; atomilot care apar, pe orice nivel, dar in aceeasi ordine.

(defun lista( x )
    (cond 
        ((null x) nil)         ; daca lista e vida, returneaza nil
        ((atom x) (list x))    ; daca x e atom, returneaza o lista cu x
        (t (mapcan #'lista x)) ; altfel, returneaza concatenarea listelor 
                               ;   obtinute din aplicarea functiei lista 
                               ;   pe fiecare element al lui x
    ) 
)

(print (lista '(((A B ) C) (D E))))
(print (lista '(((A B ) C) (D E) F)))
(print (lista '(((A B ) C) (D E) F G)))
(print (lista '(A B C D E)))
(print (lista '()))
(print (lista '(A (B) C (D) E (F))))
(print (lista '(1 2 3 (4 5 6 (7 8 9) (10 11 12)))))