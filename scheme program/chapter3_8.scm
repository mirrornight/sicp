(define f
	(lambda (first-value)
		(set! f (lambda (secont-value) 0))
		first-value))