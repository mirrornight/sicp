;(define (iterative-improve close-enough? improve)
;	(lambda (x)
;		(let ((xim (improve x)))
;			(if (close-enough? x xim)
;				xim
;				((iterative-improve close-enough? improve) xim)))))
;---------------------------------------------------------------
(define (iterative-improve improve close-enough?)
	(lambda (first-guess)
		(define (try guess)
			(let ((next (improve guess)))
				(if (close-enough? guess next)
					next
					(try next))))
		(try first-guess)))


(define (fixed-point f first-guess)
	(define tolerance 0.00001)
    (define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
    (define (improve guess)
    	(f guess))
	((iterative-improve improve close-enough?) first-guess))

(define (sqrt x)
	(define (close-enough? guess next)
		(< (abs (- guess next)) 0.00001))
	(define (improve guess)
		(average guess (/ x guess)))
	(define (average x y)
		(/ (+ x y) 2))
	((iterative-improve improve close-enough?) 1.0))
