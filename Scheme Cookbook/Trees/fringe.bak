#lang simply-scheme

;takes a tree (represented as list) and returns a list whose elements are all the leaves of the tree

(define (fringe seq)
  (cond((empty? seq) '())
       ((not(pair? seq)) (list seq))
       (else (append(fringe (car seq))(fringe (cdr seq))))))

(define x 
  (list (list 1 2) (list 3 4)))

(fringe x)

(fringe (list x x))