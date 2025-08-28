#lang simply-scheme

;takes a list and reverses all the elements in the list

(define (reverse items)
  (if (empty? items) '()
      (append (reverse (cdr items) (list (car items))))))

; why take (list (car items) and not just (car items)?
; because reverse procedure takes a list as an argument and just (car items) is not a list

;Solution 2 with Iterative procedure

(define (reverse2 lst)
  (define (iter old new)
    (if (null? old)
	new
	(iter (cdr old) (cons (car old) new))))
  (iter lst '() ))