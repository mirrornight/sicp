(define (cube-iter guess x)
	(if (good-enough? guess (improve guess x))
		(improve guess x)
		(cube-iter (improve guess x)
			x)))

(define (improve guess x)
	(/ (+ (/ x (* guess guess)) (* 2 guess))
		3))


(define (good-enough? old-guess new-guess)
	(> 0.01 
		(/ (abs (- new-guess old-guess))
			old-guess)))

(define (cube x)
	(cube-iter 1.0 x))