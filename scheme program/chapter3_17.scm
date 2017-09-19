(define (count-pairs x)
	(length (iter x '())))

(define (iter x L)
	(if (and (pair? x)
		     (false? (memq x L)))
		(iter (car x)
			  (iter (cdr x) (cons x L)))
		L))

(define x (list 'a 'b))

(define z1 (cons x x))