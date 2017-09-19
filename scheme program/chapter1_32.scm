;(define (accumulate combiner null-value term a next b)
;	(if (> a b)
;		null-value
;		(accumulate combiner (combiner (term a) null-value) term (next a) next b)))

(define (accumulate combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a)
				  (combiner result (term a)))))
	(iter a null-value))