(define (count-leaves t)
	(accumulate +
				0
				(map (lambda (sub-tree)
					         (cond ((not (pair? sub-tree)) 1)
					         	   (else (count-leaves sub-tree))))
					 t)))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence)
			(accumulate op initial (cdr sequence)))))

(define (map p sequence)
	(accumulate (lambda (x y)
		                (cons (p x) y))
	            '()
	            sequence))