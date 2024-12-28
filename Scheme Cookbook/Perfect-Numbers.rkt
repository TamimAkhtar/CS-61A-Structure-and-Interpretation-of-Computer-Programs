#lang simply-scheme

; Find perfect numbers
; we dont need to go through all numbers to find all factors, we can do something like if 'a' is a factor of 'n', then n/a should also be  factor.
; this way i only have to check all 'a' until sqrt n 


(define (perf? n)
  (define (iter limit test sum)
    (cond ((> test limit) sum)
	  ((= (remainder n test) 0)
	   (cond ((= test limit) (+ sum test))
		 (else (iter limit (+ test 1) (+ sum test (/ n test))))))
	  (else (iter limit (+ test 1) sum))))
  (= n (iter (sqrt n) 2 1)))

(define (next-perf n)
  (cond	((< n 2) (next-perf 2))
        ((perf? n) n)
	(else (next-perf (+ n 1)))))
