(define (cont-frac N D k)
	(define (cf i result)
		(if (= i k)
			result
			(cf (+ i 1) (/ (N i)
				           (+ (D i) result)))))
	(+ 2 (cf 1 (/ (N k) (D k)))))

(cont-frac (lambda (i) 1.0)
	       (lambda (i) (if (= 0 (/ (+ i 1) 3))
	       			       (+ 2 (/ (+ i 1) 3))
	       			       1))
	       10)