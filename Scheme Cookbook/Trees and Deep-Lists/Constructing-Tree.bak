#lang simply-scheme

;constructing a tree using data abstraction

(define make-tree cons) ;constructor

(define datum car) ;selector
(define children cdr) ;selector

(define (is-leaf? node)
  (null? (children node)))

(define (leaves . seq)
  (map (lambda (x)(make-tree x '())) seq))

(define tree-1
  (make-tree 1 (list (make-tree 2 (leaves 3 4))
                     (make-tree 5 (leaves 6 7 8)))))

; the leaves procedure takes a variable number of arguments and treats them like a list called seq
; it then creates a list with all elements also a list
; so (leaves 3 4 5) creates ((3) (4) (5))

