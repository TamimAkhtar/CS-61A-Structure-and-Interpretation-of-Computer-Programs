#lang simply-scheme

(define (sort sent)
  (if (empty? sent) '()
      (insert (first sent)(sort(bf sent)))))

(define (insert num sent)
  (cond((empty? sent)(se num))
       ((< num (first sent))(se num sent))
       (else (se (first sent)(insert num (bf sent))))))


; This really is a genius way to solve this problem.
; the sort function sorts the sent by stripping it down to the very last element and then calls the insert function which compares the second-last number
; with the last number and sorts it
; then the third last number is compared with each of the last 2 numbers and sorted
; then the fourth last number is compared with each of the last 3 numbers and sorted

; so insert function always assumes that the sent is sorted which is being done by the sort function using which in turn uses the sort function.
