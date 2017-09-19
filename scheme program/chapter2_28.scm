(define (fringe L)
	(define (iter L result)
		(if (null? L)
			result
			(cond ((not (pair? (car L)))
						(cons (car L) 
							  (iter (cdr L) result)))
			      (else 
			            (append (iter (car L) result) 
			            	    (iter (cdr L) result))))))
	(iter L '()))

(define (append list1 list2)
	(if (null? list1)
		list2
		(cons (car list1) (append (cdr list1) list2))))

