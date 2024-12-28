#lang simply-scheme

;append procedure that we use for lists: primitive procedures that appends 2 lists to a single lists. both arguments to the function should be lists

(define (append lst1 lst2)
  (if (null? lst1) lst2
      (cons (car lst1)(append(cdr lst1) lst2))))

(define squares
  (list 1 2 4))

(define triples
  (list 1 9 16))
