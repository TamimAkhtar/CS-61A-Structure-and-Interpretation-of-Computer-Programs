#lang simply-scheme

;higher order procedure for lists that takes a fn and applies it to every element of a list
;the fn should be a one-argument function
;returns a list with the fn applied to each element

(define (map fn seq)
  (if (null? seq) '()
      (cons(fn (car seq))(map fn (cdr seq)))))

(define (square a)
  (* a a ))
      
