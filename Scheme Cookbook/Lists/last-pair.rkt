#lang simply-scheme

;returns a list that contains only the last element of a given list

(define (last-pair lst)
  (if (null? (cdr lst)) lst
      (last-pair (cdr lst))))
