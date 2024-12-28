#lang simply-scheme

;takes a tree and multiplies all the leaves of the tree with a factor

(define (scale-tree factor seq)
  (cond((empty? seq) '())
       ((not(pair? seq)) (* seq factor))
       (else (cons (scale-tree factor (car seq))(scale-tree factor (cdr seq))))))


(scale-tree 10 (list 1 
                  (list 2 (list 3 4) 5) 
                  (list 6 7)))

;one way to do this is to use map. we think of the tree as a sequence of subtrees and map over the sequence
;calling map on each subtree

(define (scale-tree2 factor seq)
  (map(lambda (subtree)
    (if (pair? subtree)(scale-tree2 factor subtree)
        (* factor subtree)))
      seq))

; let say my sequence is (1 (2 (3 4) 5)(6 7)).
; map applies my lambda function individually to 1, (2 (3 4) 5) and to (6 7)
; my function checks if the element is a leaf, it multiplies it by the factor, if not, it calls the function again recursively
; so in a way, I am using my recusrion to go down the tree vertically and using map to go horizontally over the branches

(scale-tree2 10 (list 1 
                  (list 2 (list 3 4) 5) 
                  (list 6 7)))