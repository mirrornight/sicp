(define (deep-reverse L)
	(define (iter L result)
		(if (null? L)
			result
			(iter (cdr L) (cons (cond ((not (pair? (car L))) 
				                      	(car L))
				                      (else 
				                      	(reverse (car L))))
				                result))))
	(iter L '()))