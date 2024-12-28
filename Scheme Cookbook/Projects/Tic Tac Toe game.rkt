#lang simply-scheme

(define (Tic-Tac-Toe me board_pos)
  (cond((already-tied? me board_pos))
       ((already-won? me board_pos))
       ((can-i-win? me board_pos))
       ((can-opponent-win? me board_pos))
       ((can-i-fork? me board_pos))
       ((can-i-offend? me board_pos))
       (else (best-free-square me board_pos))))


;representing board position as a word
;(define board_pos '__o_xox_x)

;extract the value of the nth square from the board position
(define (OGitem board_pos nth)
  (define (helper board_pos nth count)
    (cond((empty? board_pos) "No such square found")
         ((equal? count nth) (first board_pos))
         (else (helper (bf board_pos) nth (+ 1 count)))))
  (helper board_pos nth 1))

;I want to modify the above funtion a bit so that when the nth square is empty, it returns me the number rather than '_'

(define (item board_pos nth)
  (if (equal? '_ (OGitem board_pos nth)) nth
      (OGitem board_pos nth)))
                             
                             
;Lets now represent our board position in terms of a sentence of winning combinations

;my winning combinations are:
(define winning_combinations "123 456 789 147 258 369 159 357")

;first lets represent one triplet, say the triplet 123 or 456 for eg.
(define (OGtriplet board_pos combination)
  (word (item board_pos (first combination))(item board_pos (first (bf combination)))(item board_pos (last combination))))

;another way to do this is to use 'every' and 'accumulate'
(define (triplet board_pos combination)
  (accumulate word
              (every (lambda (nth)(item board_pos nth)) combination)))

;now we want to get all the winning triplet combinations on the board
(define (triplet_combinations board_pos)
  (every (lambda (combination)(triplet board_pos combination)) '(123 456 789 147 258 369 159 357)))

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------
;Can I win? procedure

;first lets take one triplet and see how many x or o are in that triplet, we can use the primitive procedure 'appearances' which I wrote in the cookbook

(appearances 'o 'oo7)

;now lets check if the computer's symbol appears twice and the third square is not the opponent in the triplet, return true or false

(define (triplet_check me triplet)
  (cond((empty? triplet) #f)
       ((and(= (appearances me triplet) 2) (not(member? (opponent me) triplet))) #t)
       (else #f)))

(define (opponent me)
  (if (equal? me 'x) 'o
      'x))

; now lets take the board position with all winning combination and return false if there is no winning combination available and true if there is

(define (win-check-pred me board_pos)
  (not(empty?(keep(lambda (triplet)(triplet_check me triplet))(triplet_combinations board_pos)))))

;if we do have a winning combination, return the square number that the computer should move too

(define (can-i-win? me board_pos)
  (win-check(keep(lambda (triplet)(triplet_check me triplet))(triplet_combinations board_pos))))

(define (win-check winning-triples)
  (if (empty? winning-triples) #f
      (keep number? (first winning-triples))))


;--------------------------------------------------------------------------------------------------------------------------------------------------------------
;can-opponent-win? procedure

(define (can-opponent-win? me board_pos)
  (can-i-win? (opponent me) board_pos))

;---------------------------------------------------------------------------------------------------------------------------------------------------------------
;i-can-fork? procedure

;using the board position and winning combinations, we first find triplets in which one of the square is taken by computer and the other 2 are free
(define (fork-check-on-triplet-predicate me triplet)
  (and (member? me triplet) (not(member? (opponent me) triplet))))

;now we find all triplets from the board_pos that satisfy the above condition 
(define (fork-triplets me board_pos)
  (keep(lambda (triplet)(fork-check-on-triplet-predicate me triplet))(triplet_combinations board_pos)))

;'x 'xo__x___o

;we now want to return the pivot numbers from the fork-triplets that we found


(define (pivot-numbers me board_pos)
  (pivot-checker(keep number? (accumulate word (fork-triplets me board_pos)))))

(define (pivot-checker all-nums)
  (keep (lambda (digit)(>= (appearances digit all-nums)2)) '(1 2 3 4 5 6 7 8 9)))

(define (can-i-fork? me board_pos)
  (if (empty? (pivot-numbers me board_pos)) #f
      (first (pivot-numbers me board_pos))))


;---------------------------------------------------------------------------------------------------------------------------------------------------------------
;Taking the offensive

; takes my symbol and board_pos and returns in which square I should advance
(define (can-i-offend? me board_pos)
  (best-move (keep (lambda (triplet) (fork-check-on-triplet-predicate me triplet)) (triplet_combinations board_pos))
             me
             board_pos))


;Takes all my fork triplets now (my-fork-triplets), considers just the first triplet of those fork triplets
(define (best-move my-fork-triplets me board_pos)
  (if (empty? my-fork-triplets)
      #f
      (best-square (first my-fork-triplets) me board_pos)))


; Here I take one of my fork triplet only like 36o for example with my symbol and the board position
(define (best-square my-fork-triplet me board_pos)
  (best-square-helper (pivot-numbers (opponent me) board_pos)
		      (keep number? my-fork-triplet)))

; I take the opponent pivots and one of my fork triplets(only the numbers from it)
(define (best-square-helper opponent-pivots pair)
  (if (member? (first pair) opponent-pivots)
      (first pair)
      (last pair)))


;----------------------------------------------------------------------------------------------------------------------------------------------------------------
;best free square if all else fails

(define (best-free-square me board_pos)
  (first-choice (accumulate word (triplet_combinations board_pos))
		'(5 1 3 7 9 2 4 6 8)))

(define (first-choice possibilities preferences)
  (first (keep (lambda (square) (member? square possibilities))
	       preferences)))

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------
;already-won?

(define (already-won? me board_pos)
  (cond((member? (word me me me) (triplet_combinations board_pos)) (display "YAYYYY I won, LOSER "))
       ((member? (word (opponent me) (opponent me) (opponent me)) (triplet_combinations board_pos)) (display "I LOST :( "))
       (else #f)))

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------

;already tied

(define (already-tied? me board_pos)
  (cond((can-i-win? me board_pos))
       ((can-opponent-win? me board_pos))
       ((equal? (count(keep draw-identifier? board_pos)) 1)(display "GAME TIED, BUT YOU'RE STILL A LOSER"))
       ((empty? (keep number? (accumulate word (triplet_combinations board_pos)))) (display "GAME TIED, BUT YOU'RE STILL A LOSER"))
       (else #f)))

(define (draw-identifier? wd)
  (member? '_ wd))
  
              
  



  

                  


     
   
  