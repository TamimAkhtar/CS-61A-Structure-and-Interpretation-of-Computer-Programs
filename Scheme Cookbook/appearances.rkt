#lang simply-scheme

;This is a primitive scheme procedure that counts how many times a letter appears in a word

(define (appearances letter wd)
  (define (helper letter wd count)
    (cond((empty? wd) count)
         ((equal? letter (first wd)) (helper letter (bf wd)(+ 1 count)))
         (else (helper letter (bf wd) count))))
  (helper letter wd 0))
  
  
