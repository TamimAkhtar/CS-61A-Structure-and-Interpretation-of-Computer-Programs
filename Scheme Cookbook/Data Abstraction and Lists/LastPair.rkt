#lang simply-scheme

;returns the last element of a given non-empty list

(define (LastPair lst)
  (cond ((empty? lst) (error "LastPair expects a Non-Empty list"))
        ((equal? (cdr lst) null) lst)
        (else (LastPair (cdr lst)))))
        


