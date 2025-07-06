#lang simply-scheme

;procedure keep that applies a predicate fn given as an argument to each word of an argument sentence and retuens just the words
;which satisfy the predicate fn

(define (keep nums pred)
  (cond ((empty? nums) '())
        ((pred (first nums)) (se (first nums)(keep (bf nums) pred)))
        (else (keep (bf nums) pred))))

;for eg I want to return only even numbers in a sentence of numbers

(define (iseven? n)
  (equal? (remainder n 2) 0))

(keep '(3 4 5 6 7 8 9) iseven?)

;keep only works with a pred function that is a function having one argument
