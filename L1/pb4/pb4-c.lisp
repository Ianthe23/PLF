; Sa se scrie o functie care plecand de la o lista data ca argument,
; inverseaza numai secventele continue de atomi. Exemplu:
;; (a b c (d (e f) g h i)) -> (c b a (d (f e) i h g))

; inverseaza - functie care inverseaza secventele continue de atomi
; l - lista data
; ok - integer, 1 daca am gasit un atom, 0 altfel
; rez - lista, lista rezultat
(defun inverseaza(l ok rez)
    (cond
        ((null l) rez) ; daca lista e vida, returnam rezultatul
        ((AND (atom (car l)) (atom (cadr l))) (inverseaza (cdr l) 1 (cons (car l) rez))) ; daca primul si al doilea element sunt atomi, adaugam primul element la rezultat
        ((AND (atom (car l)) (= ok 1)) (append (cons (car l) rez) (inverseaza (cdr l) 0 nil))) ; daca primul element e atom si ok e 1, adaugam primul element la rezultat si apelam recursiv pe restul listei
        ((AND (atom (car l)) (= ok 0)) (cons (car l) (inverseaza (cdr l) 0 nil))) ; daca primul element e atom si ok e 0, adaugam primul element la rezultat si apelam recursiv pe restul listei
        (t (cons (inverseaza (car l) 0 nil) (inverseaza (cdr l) 0 nil))) ; altfel, apelam recursiv pe primul element si pe restul listei
    )
)

; main - functie care apeleaza functia de inverseaza cu lista data
; l - lista data
(defun main(l)
    (inverseaza l 0 nil)
)

(print (main '(a b c (d (e f) g h i))))