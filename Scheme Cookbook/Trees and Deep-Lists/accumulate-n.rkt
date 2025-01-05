#lang simply-scheme

;accumulate-n takes a deep list and applies the accumulate procedure to the deep list
;accumulate procedure is same as before and is for a single list

(define (accumulate fn init sequence)
  (if (empty? sequence) init
      (fn (car sequence)(accumulate fn init (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))

;use the same accumulate procedure on a sequence of list now
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons
       (accumulate op init (map car seqs))
       (accumulate-n op init (map cdr seqs)))))

(accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
