#lang simply-scheme

;returns a sentense which contains every nth word of a sentence

(define (every-nth num sent)
  (define (helper num sent counter)
    (cond((empty? sent) '())
         ((equal? num counter) (se (first sent)(helper num (bf sent) 1)))
         (else (helper num (bf sent) (+ 1 counter)))))
  (helper num sent 1))
  
