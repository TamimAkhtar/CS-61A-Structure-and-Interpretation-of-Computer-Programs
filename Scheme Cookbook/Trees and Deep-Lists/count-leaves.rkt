#lang simply-scheme

;counts the number of leaves in a tree

(define (count-leaves seq)
  (cond((empty? seq) 0)
       ((not(pair? seq)) 1)
       (else (+ (count-leaves (car seq))(count-leaves (cdr seq))))))

(define x (cons (list 1 2) (list 3 4)))

x

(count-leaves x)

(list x x)

(count-leaves (list x x))