#lang simply-scheme

;produce a deep-reverse procedure that takes a list as argument and returns as its value the
;list with its elements reversed and with all sublists deep-reversed as well

(define (DeepReverse tree)
  (if (pair? tree)
      (reverse (map DeepReverse tree))
      tree))

;This solution is beautiful!!!!!