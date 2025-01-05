#lang simply-scheme

;primitive scheme procedure that applies a given function to a list as a whole

(define (accumulate fn init sequence)
  (if (empty? sequence) init
      (fn (car sequence)(accumulate fn init (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))


