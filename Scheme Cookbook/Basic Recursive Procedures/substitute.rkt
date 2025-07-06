#lang simply-scheme

;procedure substitute takes 3 arguments, a sentence, an old word and a new word. replaces every occurence of old word with a new word

(define (substitute sent old new)
  (cond ((empty? sent) '())
	((equal? (first sent) old)
	 (se new (substitute (butfirst sent) old new)))
	(else (se (first sent) (substitute (butfirst sent) old new)))))
