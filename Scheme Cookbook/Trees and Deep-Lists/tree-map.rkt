#lang simply-scheme

(define make-Tree cons)
(define datum car)
(define children cdr)

;Method 1

;here, we apply our fn to each element of the tree
;we start with applying our function to the first element of the tree and then using map, we call our function recursively
;to all the remaining lists/sub-trees that we have.

(define (treemap fn tree)
  (make-Tree (fn (datum tree))
        (map (lambda (sub-tree) (treemap fn sub-tree))(children tree))))

(define (square num)
  (* num num))


;Method 2

;In this procedure, I apply my function to the first element/datum/ car tree
;the remaining elements is a list of of all the sub-trees and I call them a forest (list of trees)
;I call the forest-map procedure on the forest

;forest-map takes a forest and applies the treemap procedure to the first tree/list and calls forest-map recursively again to the remaining forest (list of trees)

(define (treemap2 fn tree)
  (make-Tree (fn (datum tree))
        (forest-map fn (children tree))))

(define (forest-map fn forest)
  (if (empty? forest)'()
      (cons (treemap2 fn (car forest)) (forest-map fn (cdr forest)))))
      