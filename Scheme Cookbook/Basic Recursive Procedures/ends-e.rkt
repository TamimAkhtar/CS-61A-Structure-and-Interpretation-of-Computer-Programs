#lang simply-scheme

;return only those words in a setence that end with an e

(define (ends-e sent)
  (cond ((empty? sent) '())
	((equal? (last (first sent)) 'e)
	 (se (first sent) (ends-e (bf sent))))
	(else (ends-e (bf sent)))))