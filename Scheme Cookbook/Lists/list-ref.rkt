#lang simply-scheme

;list-ref takes as arguments a list and a number n and returns the nth element of the list
; number the elements of the list beginning with 0

(define (list-ref lst n)
  (define (helper lst n count)
    (cond ((null? lst) (write "List not that long"))
          ((equal? n count) (car lst))
          (else (helper (cdr lst) n (+ 1 count)))))
  (helper lst n 0))
                            
(define squares
  (list 1 4 9 16))

;another way using a recursive procedure

;(define (list-ref lst n)
  ;(if (equal? n 0) (car lst)
      ;(list-ref (cdr lst)(- n 1))))