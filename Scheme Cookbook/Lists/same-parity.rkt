#lang simply-scheme

;takes a list, takes the first number of list and checks if its odd or even,
;then depending on that first number, returns all the odd or even numbers in the rest of the list

(define (same-parity tester . others)
  (define (helper numlist)
    (cond((null? numlist) '())
         ((equal? (even? tester)(even? (car numlist))) (cons (car numlist)(helper (cdr numlist))))
         (else (helper (cdr numlist)))))
  (cons tester (helper others)))
