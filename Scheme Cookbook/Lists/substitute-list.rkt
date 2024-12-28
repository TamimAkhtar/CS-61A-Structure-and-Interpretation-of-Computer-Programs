#lang simply-scheme

;take a list (which can also have sublists) and substitute each occurance of the old-word with the new-word

(define (substitute items old-word new-word)
  (cond((null? items) '())
       ((equal? (car items) old-word)(cons new-word (substitute (cdr items) old-word new-word)))
       ((pair? (car items))(cons (substitute (car items) old-word new-word)(substitute (cdr items) old-word new-word)))
       (else (cons (car items) (substitute (cdr items) old-word new-word)))))

(define mylist
  (list '(lead guitar) '(bass guitar) '(rhythm guitar) 'drums))



    
       
  



  
