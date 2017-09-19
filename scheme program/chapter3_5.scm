(define (monte-carlo trials experiment)
	(define (iter trials-remaining trials-passed)
		(cond ((= trials-remaining 0)
			   (/ trials-passed trials))
		      ((experiment)
		       (iter (- trials-remaining 1) (+ trials-passed 1)))
		      (else
		       (iter (- trials-remaining 1) trials-passed))))
	(iter trials 0))

(define (estimate-integral P x1 x2 y1 y2 trials)		  
	(* 4
	   (monte-carlo trials 
	     		    (lambda ()
	     		        (P (random-in-range x1 x2)
	     		           (random-in-range y1 y2))))))

(define (random-in-range low high)
	(let ((range (- high low)))
		(+ low (random (exact->inexact range)))))

(define (P x y)
	(<= (+ (square x) (square y)) 1.0))

(define (estimate-pi trials)
	(exact->inexact (estimate-integral P -1.0 1.0 -1.0 1.0 trials)))



