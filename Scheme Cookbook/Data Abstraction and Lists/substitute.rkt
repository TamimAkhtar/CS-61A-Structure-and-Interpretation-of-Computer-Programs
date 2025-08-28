#lang simply-scheme

;a procedure substitute that takes three arguments: a list, an old word, and a new word.
;It should return a copy of the list, but with every occurrence of the old word replaced by the new word, even in sublists. For example:
; > (substitute ’((lead guitar) (bass guitar) (rhythm guitar) drums) ’guitar ’axe)
; ((lead axe) (bass axe) (rhythm axe) drums)

(define (substitute items oldWord newWord)
  (cond ((empty? items) '() )
        ((equal? (car items) oldWord) (cons newWord (substitute (cdr items) oldWord newWord)))
        ((pair? (car items)) (cons (substitute (car items) oldWord newWord) (substitute (cdr items) oldWord newWord)))
        (else (cons (car items)(substitute (cdr items) oldWord newWord)))))
