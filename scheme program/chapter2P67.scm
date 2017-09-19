(define (list-ref L n)
	(if (= n 0)
		(car L)
		(list-ref (cdr L) (- n 1))))

(define (length L)
	(if (null? L)
		0
		(+ 1 (length (cdr L)))))

(define (length L)
	(define (iter L result)
		(if (null? L)
			result
			(length (cdr L) (+ result 1))))
	(iter L 0))

(define (append list1 list2)
	(if (null? list1)
		list2
		(cons (car list1) (append (cdr list1) list2))))