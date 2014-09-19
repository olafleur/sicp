;1.2
;(/ (+ 5
;        4
;        (- 2
;           (- 3
;              (+ 6
;                 (/ 4 5)))))
;     (* 3
;        (- 6 2)
;        (- 2 7)))

;1.3
(define (square x) (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (procedure x y z)
    (if (> x y)
        (if (> y z)
            (sum-of-squares x y)
            (sum-of-squares x z))
        (if (> x z)
            (sum-of-squares y x)
            (sum-of-squares y z))))

;1.4
;L'opérateur utilisé varie en fonction du signe de b

;1.5
;Si c'est lazy, la réponse est 0, sinon, c'est une boucle infinie.

;1.6
;Boucle à l'infini car l'évaluation n'est pas lazy

;1.8
(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (cubic-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-iter (improve guess x)
                  x)))

(define (sqrt3 x)
  (cubic-iter 1.0 x))

;1.9