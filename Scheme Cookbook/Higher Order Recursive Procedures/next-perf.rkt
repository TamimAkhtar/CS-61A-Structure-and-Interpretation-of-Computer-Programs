#lang simply-scheme

(define (listFactors n)
  (define (helper n init)
    (cond ((> init (/ n 2)) '())
          ((equal? (remainder n init) 0) (se init (helper n (+ init 1))))
          (else (helper n (+ init 1)))))
  (helper n 1))
          
(define (sumList lst)
  (if (empty? lst) 0
      (+ (first lst)(sumList (bf lst)))))

(define (sumFactors n)
  (sumList (listFactors n)))

(define (next-perf n)
  (let ((z (+ n 1)))
    (if (equal? z (sumFactors z)) z
      (next-perf z))))

