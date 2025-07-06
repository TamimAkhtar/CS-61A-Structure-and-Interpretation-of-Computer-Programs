#lang simply-scheme

;removes duplicates word from a sentence

(define (duplsRemoved sent)
  (cond ((empty? sent) '())
        ((member? (first sent) (bf sent)) (duplsRemoved (bf sent)))
        (else (se (first sent)(duplsRemoved (bf sent))))))
