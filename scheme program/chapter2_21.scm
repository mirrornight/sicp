(define (square-list L)
	(map (lambda (x)
		         (square x))
	     L))

(define (map proc items)
	(if (null? items)
		'()
		(cons (proc (car items))
			  (map proc (cdr items)))))