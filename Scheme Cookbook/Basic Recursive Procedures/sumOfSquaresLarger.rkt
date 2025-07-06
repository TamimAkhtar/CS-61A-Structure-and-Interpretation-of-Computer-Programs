#lang simply-scheme

;Take 3 numbers and return the sum of the squares of the larger 2 numbers

(define (sumOfSquares a b)
  (+ (square a) (square b)))

(define (square a)
  (* a a))

(define (sumOfSquaresLarger a b c)
  (cond ((and (< a b) (< a c)) (sumOfSquares b c))
        ((< b c) (sumOfSquares a c))
        (else (sumOfSquares a b))))
