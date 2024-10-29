#lang simply-scheme

;Take a range of numbers and apply any function to each number individually and return the sum

(define (range_sum fn a b)
  (if (> a b) 0
      (+ (fn a)(range_sum fn (+ a 1) b))))

; for eg, find the sum of squares of the numbers 1 to 5

(define (square n)
  (* n n))

(range_sum square 1 5)
