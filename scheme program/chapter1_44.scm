(define (smooth f)
	(lambda (x) (/ (+ (f (- x dx))
		           (f x)
		           (f (+ x dx)))
	             3)))

(define dx 0.00001)

(define (repeated f n)
	(if (= n 1)
		f
		(lambda (x)
			(f ((repeated f (- n 1)) x)))))

;(define (repeated-smooth f n)
;	((repeated smooth n) f))

(define (smooth-n-times f n)
	(let ((n-times-smooth (repeated smooth n)))
		(n-times-smooth f)))
