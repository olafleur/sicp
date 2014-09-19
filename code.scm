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
; a) récursif
; b) itératif

;1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
;a) 1) 1024
;   2) 65536
;   3) 65536
;b) 1) (A 0 n) = 2n
;   2) (A 1 n) = 2^n
;   3) (A 2 n) = 2^2^2^2...^2 (n fois)

;1.11
; récursif
(define (ex11 n)
  (if (< n 3)
      n
      (+ (ex11 (- n 1))
         (* 2
            (ex11 (- n 2)))
         (* 3
            (ex11 (- n 3))))))

; itératif
