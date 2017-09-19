(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		'()
		(cons (accumulate op init (map1 car seqs))
			  (accumulate-n op init (map1 cdr seqs)))))

(define (map1 p sequence)
	(accumulate (lambda (x y)
		                (cons (p x) y))
	            '()
	            sequence))

(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence)
			(accumulate op initial (cdr sequence)))))