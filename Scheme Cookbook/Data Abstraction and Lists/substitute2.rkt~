#lang simply-scheme

; write substitute2 that takes a list, a list of old words, and a list of new words; the last two lists should be the same length.
; It should return a copy of the first argument, but with each word that occurs in the second argument replaced by the corresponding word of the third argument:
; > (substitute2 ’((4 calling birds) (3 french hens) (2 turtle doves)) (1 2 3 4) ’(one two three four))
; ((four calling birds) (three french hens) (two turtle doves))



(define (Substitute2 lst olds news)
  (cond ((null? lst) '())
	((pair? lst)
	 (cons (Substitute2 (car lst) olds news)
	       (Substitute2 (cdr lst) olds news)))
	(else (FindMatch lst olds news))))


;Lets check which element needs to be substituted

(define (FindMatch element olds news)
  (cond ((null? olds) element)
	((equal? element (car olds))
	 (car news))
	(else (FindMatch element (cdr olds) (cdr news)))))