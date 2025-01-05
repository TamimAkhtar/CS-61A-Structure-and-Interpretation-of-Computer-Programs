#lang simply-scheme

(define make-tree cons)
(define datum car)
(define children cdr)

;Method 1
;for-each applies the recursive procedure to each child of the tree.
; it does not produce a return value, we only use this for the side-effect (printing in our case)
(define (depth-first-search tree)
  (print (datum tree))
  (for-each depth-first-search (children tree)))


;Method 2
;as map creates a list of results from the recursive call.
;since the recursive calls do not return any meaningful values(it only prints), map keeps returning empty () similar to the tree structure of the input 
(define (depth-first-search2 tree)
  (print (datum tree))
  (map (lambda (children)(depth-first-search2 children)) (children tree)))
         
