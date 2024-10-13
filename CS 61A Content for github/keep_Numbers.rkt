#lang simply-scheme

; take a sentence of numbers and return only the numbers(return as a sentence) which meet a specific condition

(define (keep_numbers nums pred)
  (cond ((empty? nums) '())
        ((pred (first nums)) (se (first nums)(keep_numbers (bf nums) pred)))
        (else (keep_numbers (bf nums) pred))))

;for eg I want to return only even numbers in a sentence of numbers

(define (iseven? n)
  (equal? (remainder n 2) 0))

(keep_numbers '(3 4 5 6 7 8 9) iseven?)
