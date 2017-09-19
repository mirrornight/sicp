(define (last-pair L)
	(if (null? (cdr L))
		(car L)
		(last-pair (cdr L))))