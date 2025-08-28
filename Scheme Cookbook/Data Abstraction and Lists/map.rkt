#lang simply-scheme

; Apply some transformation/procedure to each element in a list and return the new list of results

(define (map proc items)
  (if (empty? items) '()
      (cons (proc (car items)) (map proc (cdr items)))))