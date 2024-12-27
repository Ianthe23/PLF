; Sa se inlocuiasca fiecare sublista a unei liste cu ultimul ei element
; Prin sublista se intelege element de pe primul nivel, care e lista

; ultim_element: list int -> int
; intoarce ultimul element al unei liste
(defun ultim_element(l element)
    (cond
        ((null l) element) ; daca lista e vida, intoarce elementul anterior
        (t (ultim_element (cdr l) (car l))) ; altfel, apeleaza recursiv pentru coada listei
    )
)

; exista_sublista: list -> bool
; verifica daca o lista contine o sublista
(defun exista_sublista(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((atom (car l)) (exista_sublista (cdr l))) ; daca primul element e atom, ignora-l
        (t t) ; altfel, returneaza true
    )
)

; eliminare_subliste: list -> list
; inlocuieste fiecare sublista cu ultimul ei element
(defun eliminare_subliste(l)
    (cond
        ((null l) nil) ; daca lista e vida, returneaza nil
        ((atom (car l)) (cons (car l) (eliminare_subliste (cdr l)))) ; daca primul element e atom, adauga-l la rezultat si apeleaza recursiv pentru coada listei
        (t (cons (ultim_element (car l) 0) (eliminare_subliste (cdr l)))) ; altfel, adauga ultimul element al primei liste la rezultat si apeleaza recursiv pentru coada listei
    )
)

; inlocuire: list -> list
; inlocuieste fiecare sublista cu ultimul ei element
(defun inlocuire(l)
    (cond
        ((null l) nil)
        ;daca exista subliste in lista
        ((exista_sublista l) (progn
            (print (eliminare_subliste l)) ; afiseaza rezultatul
            (inlocuire (eliminare_subliste l)) ; apeleaza recursiv pentru rezultat
        ))
    )
)

; apeleaza inlocuire
(inlocuire '(a (b c) (d (e (f)))))
(inlocuire '(a (b c) (d ((e) f))))
