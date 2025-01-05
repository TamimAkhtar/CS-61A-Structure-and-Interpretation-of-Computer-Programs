#lang simply-scheme

;primitive procedure taht takes a word and a list as arguments
;returns false if word is not equal to any item in the list
;returns word and the remaining list if the word is equal to an item in the list

(define (memq word list)
  (cond ((or (empty? list) (empty? word)) #f)
        ((eq? word (car list)) list)
        (else (memq word (cdr list)))))


(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))
(memq 'apple '(x (apple sauce) y apple pear))