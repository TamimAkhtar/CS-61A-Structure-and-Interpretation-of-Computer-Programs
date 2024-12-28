#lang simply-scheme

;procedure reverse takes a list as argument and resturns a list of the same elements in reverse order

(define (reverse lst)
  (if (null? lst) '()
      (append (reverse (cdr lst))(list(car lst)))))

;since append takes 2 arguments to list, we have to use (list (car lst)) as second argument
;and not just (car lst) 