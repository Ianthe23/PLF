; Definiti o functie care intoarce cel mai mare divizor comun al numerelor dintr-o lista neliniara

; cmmdc - functie care calculeaza cel mai mare divizor comun a doua numere
; a - integer, primul numar
; b - integer, al doilea numar
(defun cmmdc(a b)
    (cond
        ((= b 0) a) ; daca b e 0, atunci cmmdc e a
        (t (cmmdc b (mod a b))) ; altfel, cmmdc e cmmdc-ul dintre b si restul impartirii lui a la b
    )
)

; parcurgere - functie care parcurge lista si calculeaza cmmdc-ul dintre elementele acesteia si un numar dat
; lista - lista data
; nr_cmmdc - integer, numarul dat
(defun parcurgere(lista nr_cmmdc)
    (cond
        ((null lista) nr_cmmdc) ; daca lista e vida, atunci nr_cmmdc e raspunsul
        ((numberp (car lista)) (parcurgere (cdr lista) (cmmdc (car lista) nr_cmmdc))) ; daca primul element e atom, atunci nr_cmmdc e cmmdc-ul dintre el si nr_cmmdc
        ((atom (car lista)) (parcurgere (cdr lista) nr_cmmdc)) ; daca primul element nu e numar si nici lista, atunci nr_cmmdc e cmmdc-ul dintre parcurgerea lui si nr_cmmdc
        (t (parcurgere (cdr lista) (parcurgere (car lista) nr_cmmdc))) ; altfel, nr_cmmdc e cmmdc-ul dintre parcurgerea primului element si nr_cmmdc
    )
)

; main - functie care apeleaza functia de parcurgere cu lista si 0
; lista - lista data
(defun main(lista)
    (parcurgere lista 0) ; apelam functia de parcurgere cu lista si 0
)

(print (main '(1 2 3 4)))
(print (main '(2 4 6)))
(print (main '(8 4 16)))
(print (main '(8 18)))
(print (main '(10 (4 6 (8)))))
(print (main '(12 (18 6 (A 12)))))