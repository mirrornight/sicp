(define (double a)
	(+ a a))

(define (halve b)
	(/ b 2))

(define (even? n)
	(= (remainder n 2) 0))

(define (multi a b)
	(multi-iter a b 0))

(define (multi-iter a b c)
	(cond ((= b 0) c)
		  ((even? b) (multi-iter (double a) 
		  						 (- (halve b) 1)
		  						 (+ c
		  						 	(double a))))
		  (else (multi-iter a
		  					(- b 1)
		  					(+ c a)))))