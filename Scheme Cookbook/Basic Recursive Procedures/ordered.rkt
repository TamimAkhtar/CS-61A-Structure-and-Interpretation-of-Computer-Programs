#lang simply-scheme

;predicate that takes a sentence of numbers and returns true if it is in ascending order

(define (ordered? numberSent)
  (cond((empty? numberSent) #t)
       ((> (first numberSent) (first (bf numberSent))) #f)
       (else (ordered? (bf numberSent)))))
