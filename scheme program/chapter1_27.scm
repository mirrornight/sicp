(define (test n)
	(test-iter n 1))

(define (test-iter n a)
	(cond ((= a n) #t)
		  ((= (expmod a n n) a) (test-iter n (+ a 1)))
		  (else #f)
		))