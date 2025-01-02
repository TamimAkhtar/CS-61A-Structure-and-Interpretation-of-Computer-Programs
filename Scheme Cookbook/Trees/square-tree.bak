#lang simply-scheme

;takes a tree and squares all the leaf values
;using higher order procedure 'map'

(define (square-tree tree)
  (map(lambda (subtree)
    (cond((empty? subtree) '())
         ((not(pair? subtree)) (* subtree subtree))
         (else (square-tree subtree))))
   tree))

;without using higher order procedure map

(define (square-tree2 tree)
  (cond((empty? tree) '())
         ((not(pair? tree)) (* tree tree))
         (else (cons (square-tree2 (car tree))(square-tree2 (cdr tree))))))


(square-tree (list 1 (list 2 (list 3 4) 5)(list 6 7)))
(square-tree2 (list 1 (list 2 (list 3 4) 5)(list 6 7)))

;notice the difference between these 2 ways
;in the first way, map takes care of traversing through the width of the tree while we treat each element of the tree as a subtree
;therefore, we dont have to recursively call our function on car of tree and cdr of tree seperately because maps takes care of that
;our recursive call takes care of the vertical traversal

;in the second way, we have to treat each element such that we call the function recursively on both car and cdr because we dont have map
; because we dont have map, I need a way to traverse the tree both horizontally and vertically, so I need to call my recursive function on both car and cdr