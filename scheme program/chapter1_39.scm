(define (cont-frac N D k)
	(define (cf k result)
		(if (= k 1)
			result
			(cf (- k 1) (/ (N (- k 1))
				           (- (D (- k 1)) result)))))
	(cf k (/ (N k) (D k))))

(define (tan-cf x k)
	(cont-frac (lambda (i) (if (> i 1)
		                       (square x)
		                       x))
	           (lambda (i) (- (* 2 i) 1.0))
	           k))