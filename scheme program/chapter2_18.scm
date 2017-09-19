(define (reverse L)
	(define (iter L list2)
		(if (null? L)
			list2
			(iter (cdr L) (cons (car L) list2))))
	(iter L (list)))
