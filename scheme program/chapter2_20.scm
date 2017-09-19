(define (same-parity x . y)
	(if (even? x)
		(cons x (reverse (find-even y)))
		(cons x (reverse (find-odd y)))))

(define (find-even L)
	(define (iter L result)
		(if (null? L)
			result
			(if (even? (car L))
				(iter (cdr L) (cons (car L) result))
				(iter (cdr L) result)))))

(define (find-odd L)
	(define (iter L result)
		(if (null? L)
			result
			(if (odd? (car L))
				(iter (cdr L) (cons (car L) result))
				(iter (cdr L) result))))
	(iter L (list)))

(define (reverse L)
	(define (iter L list2)
		(if (null? L)
			list2
			(iter (cdr L) (cons (car L) list2))))
	(iter L (list)))

(define (same-parity sample . others)
	(filter (if (even? sample)
				even?
				odd?)
			(cons sample others)))