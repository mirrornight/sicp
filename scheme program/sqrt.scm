(define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)))

;(x / guess + guess) / 2
(define (improve guess x)
	(average guess (/ x guess)))

;(x + y) / 2
(define (average x y)
	(/ (+ x y) 2))

;|guess^2 - x| < 0.001
(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))


(define (sqrt x)
	(sqrt-iter 1.0 x))