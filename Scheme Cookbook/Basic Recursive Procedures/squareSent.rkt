#lang simply-scheme

;take a sentence of numbers and square them and return them

(define (squareSent sent)
  (if (empty? sent) '()
      (se (square (first sent))(squareSent (bf sent)))))