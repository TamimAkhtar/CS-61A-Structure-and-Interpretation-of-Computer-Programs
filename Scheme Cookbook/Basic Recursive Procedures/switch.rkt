#lang simply-scheme

; takes a sentence where every instance of the words I or me is replaced by you, 
; every instance of you is replaced by me except at the beginning where its replaced by I

(define (switch sent)
  (se (switchFirst (first sent))
      (switchRest (bf sent)) ))

(define (switchFirst wd)
  (cond ((equal? wd 'you) 'I)
	((equal? wd 'I) 'you)
	((equal? wd 'me) 'you)
	(else wd) ))

(define (switchRest sent)
  (if (empty? sent)
      '()
      (se (switchOne (first sent))
	  (switchRest (bf sent)) )))

(define (switchOne wd)
  (cond ((equal? wd 'you) 'me)
	((equal? wd 'I) 'you)
	((equal? wd 'me) 'you)
	(else wd) ))
