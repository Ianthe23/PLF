; Sa se scrie o functie care determina numarul de aparitii ale unui
; atom dat intr-o lista neliniara.

; nr_aparitii - functie care calculeaza numarul de aparitii ale unui atom intr-o lista
; lista - lista data
; nr - atom, numarul dat
; aparitii - integer, numarul de aparitii ale lui nr in lista
(defun nr_aparitii(lista nr aparitii)
    (cond
        ((null lista) aparitii) ; daca lista e vida, returnam aparitiile
        ((AND (atom (car lista)) (equal (car lista) nr)) (nr_aparitii (cdr lista) nr (+ aparitii 1))) ; daca primul element e atom si e egal cu nr, atunci incrementam aparitiile
        ((atom (car lista)) (nr_aparitii (cdr lista) nr aparitii)) ; daca primul element e atom si nu e egal cu nr, atunci nu facem nimic
        (t (nr_aparitii (cdr lista) nr (nr_aparitii (car lista) nr aparitii))) ; altfel, apelam recursiv nr_aparitii pe primul element si adaugam rezultatul la aparitii
    )
)

; main - functie care apeleaza functia de nr_aparitii cu lista si numarul dat
; lista - lista data
; nr - atom, numarul dat
(defun main(lista nr)
    (nr_aparitii lista nr 0) ; apelam functia de nr_aparitii cu lista, nr si 0
)

(print (main '(1 2 3 4) 1))
(print (main '(1 2 3 4) 0))
(print (main '(1 2 (3 4 (5 6 7) (3 9))) 3))