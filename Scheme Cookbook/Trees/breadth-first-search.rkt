#lang simply-scheme

(define make-tree cons)
(define datum car)
(define children cdr)

(define (breadth-first-search tree)
  (bfs-iter (list tree)))

(define (bfs-iter queue)
  (if (empty? queue) "done"
      (let ((task (car queue)))
        (print (datum task))
        (bfs-iter (append(cdr queue)(children task))))))

;Queue is a forest (list of trees) while task is a tree
; I keep sticking the children at the back of the queue
;notice, how according to my data abstraction, I use datum and children for the task tree but car for the forest queue



(define music-tree '(music (beatles (Johny)(Ringo)) (Queen (Krix)(Klan))))

(breadth-first-search music-tree)