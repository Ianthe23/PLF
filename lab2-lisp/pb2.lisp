; sa se tipareasca lista nodurilor de pe nivelul k dintr-un arbore de tipul (1)
; tipul (1) = (A 2 B 1 C 0 D 2 E 1 F 0)
; pentru K=2 si arborele (A 2 B 2 H 0 C 0 D 2 E 1 F 0) se va tipari (H C E)
;
;; nivelk (l l2Radacina nv nm nivel k l2Ant nrMuchii dif col)
;; seminificatiile parametrilor:
;; l - lista arborilor
;; l2Radacina - numarul de muchii de adaugat al radacinii
;; nv - numarul de varfuri al subarborelui
;; nm - numarul de muchii al subarborelui
;; nivel - nivelul curent
;; k - nivelul la care se doreste sa se afiseze nodurile
;; l2Ant - numarul de muchii de adaugat al nodului anterior
;; nrMuchii - numarul de muchii al nodului care are unul sau ambii fii frunze
;; dif - numarul de noduri care nu-s fii terminali, de merg in adancime, pentru a putea scadea corespunzator nivelul
;;       pentru urmatorul nod de se afla mai sus in subarbore
;; col - lista nodurilor de pe nivelul k


(defun nivelk (l l2Radacina nv nm nivel k l2Ant nrMuchii dif col)
  (cond 
    ((null l) col)
    ((= nv (+ nm 1)) (nivelk l l2Radacina 0 0 0 k l2Radacina 0 0 col))
    ((and (not (= l2Ant 0)) (not (= (cadr l) 0)))
     (progn
    ;    (print 'cazul_l2Ant_dif_0_si_l2_dif_0)
    ;    (print (list 'current-node (car l)))
    ;    (print (+ nivel 1))
       (let ((new-col col))
         (when (= (+ nivel 1) k)
           (setq new-col (cons (car l) new-col))
           (print (list 'new-col new-col))
         )  
         (nivelk (cddr l) l2Radacina (+ nv 1) (+ nm (cadr l)) (+ nivel 1) k (cadr l) (cadr l) (+ dif 1) new-col)
       )
     )
    )
    ((and (not (= l2Ant 0)) (= (cadr l) 0))
     (progn
    ;    (print 'cazul_l2Ant_dif_0_si_l2_0)
    ;    (print (list 'current-node (car l)))  
    ;    (print (+ nivel 1))
       (let ((new-col col))
         (when (= (+ nivel 1) k)
           (setq new-col (cons (car l) new-col))
           (print (list 'new-col new-col))
         )
         (nivelk (cddr l) l2Radacina (+ nv 1) (+ nm (cadr l)) (+ nivel 1) k (cadr l) (- l2Ant 1) dif new-col)
       )
     )
    )
    ((and (= l2Ant 0) (not (= nrMuchii 0)))
     (progn
    ;    (print 'cazul_l2Ant_0_si_nrMuchii_dif_0)
    ;    (print (list 'current-node (car l))) 
    ;    (print nivel)
       (let ((new-col col))
         (when (= nivel k)
           (setq new-col (cons (car l) new-col))
           (print (list 'new-col new-col))
         ) 
         (nivelk (cddr l) l2Radacina (+ nv 1) (+ nm (cadr l)) nivel k (cadr l) (- nrMuchii 1) dif new-col)
       )
     )
    )
    ((and (= l2Ant 0) (= nrMuchii 0))
     (progn
    ;    (print 'cazul_l2Ant_0_si_nrMuchii_0)
    ;    (print (list 'current-node (car l))) 
    ;    (print (- nivel (- dif 1)))
    ;    (print dif)
       (let ((new-col col))
         (when (= (- nivel (- dif 1)) k)
           (setq new-col (cons (car l) new-col))
           (print (list 'new-col new-col))
         )  
         (nivelk (cddr l) l2Radacina (+ nv 1) (+ nm (cadr l)) (- nivel (- dif 1)) k (cadr l) (cadr l) (- dif 1) new-col)
       )
     )
    )
  )
)

;; main(k l)
;; semnificatia parametrilor:
;; k - nivelul de unde iau nodurile
;; l - lista arborelui

(defun main (k l)
  (cond
    ((= k 0) (print (list (car l))))
    (t (print (reverse (nivelk (cddr l) (cadr l) 0 0 0 k (cadr l) 0 0 nil))))
  )
)

(main 3 '(A 2 B 2 D 1 E 1 K 0 F 2 G 0 H 0 C 1 I 1 J 0))
(main 2 '(A 2 B 2 H 0 C 0 D 2 E 1 F 0))
(main 0 '(A 2 B 0 C 0))
(main 2 '(A 1 B 2 C 0 D 0))
(main 10 '(A 2 B 2 D 1 G 0 E 2 H 1 L 2 M 0 N 0 I 0 C 1 F 2 J 0 K 1 Q 1 P 2 R 0 S 0))