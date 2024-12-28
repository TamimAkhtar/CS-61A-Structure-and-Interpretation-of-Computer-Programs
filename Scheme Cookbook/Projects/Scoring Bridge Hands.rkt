#lang simply-scheme

;Cards are represented by 'h5' for 5 of hearts and 'sa' for ace of spades, so first letter represents suit and the butfirst represents the rank
; A hand is represented by a sentence for example '(sa s10 s7 s6)
; Ace has 4 points, king has 3 points, queen has 2 points, jack has 1 points, all numbered cards have 0 points

;Distribution points
; if your hand has 2 cards only from a particular suit, you get 1 extra point
; if your hand has 1 card only from a particular suit, you get 2 extra points
; if your hand has no card from a particular suit, you get 3 extra points


(define (card-val card)
  (cond((equal? (bf card) 'a) 4)
       ((equal? (bf card) 'k) 3)
       ((equal? (bf card) 'q) 2)
       ((equal? (bf card) 'j) 1)
       (else 0)))

(define (high-cards-points hand)
  (if (empty? hand) 0
      (+ (card-val (first hand)) (high-cards-points (bf hand)))))

(define (count-suit suit hand)
  (define (helper suit hand count)
    (cond((empty? hand) count)
       ((equal? suit (first (first hand)))(helper suit (bf hand) (+ 1 count)))
       (else (helper suit (bf hand) count))))
  (helper suit hand 0))

(define (suit-counts hand)
  (if (empty? hand) '()
      (se(count-suit 's hand)(count-suit 'h hand)(count-suit 'c hand)(count-suit 'd hand))))

(define (suit-dist-points num)
  (cond((equal? num 0) 3)
       ((equal? num 1) 2)
       ((equal? num 2) 1)
       (else 0)))

(define (hand-dist-points hand)
  (define variable (suit-counts hand))
  (define (helper variable)
    (if (empty? variable) 0
        (+ (suit-dist-points(first variable)) (helper (bf variable)))))
  (helper variable))

(define (bridge-val hand)
  (+ (hand-dist-points hand) (high-cards-points hand)))