#lang simply-scheme

; Y-combinator function to compute factorial

(((lambda (f)
  (lambda (n)
    (f f n)))
 (lambda (fun x)
   (if (= x 0) 1
       (* x (fun fun (- x 1)))))) 5)