; definiti o functie care determina suma a doua numere in reprezentare
; de litsa si calculeaza numarul zecimal corespunzator sumei

(defun adaugareZero1(nr1 nr2)
    (cond
        ((< (length nr1) (length nr2)) (adaugareZero1 (cons 0 nr1) nr2))
        (t nr1)
    )
)

(defun adaugareZero2(nr1 nr2)
    (cond
        ((< (length nr2) (length nr1)) (adaugareZero2 nr1 (cons 0 nr2)))
        (t nr2)
    )
)

(defun suma(nr1 nr2 r)
    (cond
    
    )
)

(defun sumaNumere(nr1 nr2)
    (let ((a (adaugareZero1 nr1 nr2))
          (b (adaugareZero2 nr1 nr2)))
        (suma a b 0)
    )
)

(print (sumaNumere '(1 2 3 9) '(4 5 6)))