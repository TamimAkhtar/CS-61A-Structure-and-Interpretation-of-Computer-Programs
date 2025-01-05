#lang simply-scheme

;constructing a Tree using data abstraction

(define make-Tree cons) ;constructor

(define datum car) ;selector
(define children cdr) ;selector

(define (is-leaf? node)
  (null? (children node)))

(define (leaves . seq)
  (map (lambda (x)(make-Tree x '())) seq))

(define tree-1
  (make-Tree 1 (list (make-Tree 2 (leaves 3 4))
                     (make-Tree 5 (leaves 6 7 8)))))

; the leaves procedure takes a variable number of arguments and treats them like a list called seq
; it then creates a list with all elements also a list
; so (leaves 3 4 5) creates ((3) (4) (5))

