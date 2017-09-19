(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

;-----------------------------------
(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cadr mobile))

(define (branch-lengh branch)
	(car branch))

(define (branch-structure branch)
	(cadr branch))
;-------------------------------------
(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile))
	   (branch-weight (right-branch mobile))))

(define (branch-weight branch)
	(if (hangs-another-mobile? branch)
		(total-weight (branch-structure branch))
		(branch-structure branch)))

(define (hangs-another-mobile? branch)
	(pair? (branch-structure branch)))

;------------------------------------------
(define (if-balance? mobile)
	(if (= (torque (left-branch mobile))
		   (torque (right-branch mobile)))
	    (total-weight mobile)
	    #f))

(define (torque branch)
	(if (hangs-another-mobile? branch)
		(* (if-balance? (branch-structure branch)) (branch-lengh branch))
		(* (branch-lengh branch) (branch-structure branch))))

(define (mobile-balance? mobile)
	(if (if-balance? mobile)
		#t
		#f))
;____________________________________________

(define (make-mobile left right)
	(cons left right))

(define (make-branch length structure)
	(cons length structure))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cdr mobile))

(define (branch-lengh branch)
	(car branch))

(define (branch-structure branch)
	(cdr branch))



