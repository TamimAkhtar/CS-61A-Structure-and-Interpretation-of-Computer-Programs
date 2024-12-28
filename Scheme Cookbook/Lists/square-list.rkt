#lang simply-scheme

;takes a list and returns the square of all elements in the list.

(define (square-list items)
  (if (empty? items) '()
      (cons(square (car items)) (square-list (cdr items)))))

(define (square n)
  (* n n))

(define mylist
  (list 1 2 3 4 5))