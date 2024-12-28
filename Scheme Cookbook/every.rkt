#lang simply-scheme

; applies an arbitrary procedure given as an argument to each word of an argument sentence or every letter of an argument word

(define (every fn sent)
  (if (empty? sent) '()
      (se (fn (first sent)) (every fn (bf sent)))))

;for eg, square every number in a sentence

(define (square n)
  (* n n))

(every square '(1 2 3 4))

;for eg return the first letter of every sentence

(every first '(you are really amazing))

;so every expects its fn to be a function which only has one argument



