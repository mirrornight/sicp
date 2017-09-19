;(define (repeated g x k)
;	(define (iter g x i)
;		(if (= i k)
;            x
;			(iter g g(x) (+ i 1))))
;	(iter g x 0))

(define (repeated f n)
	(if (= n 1)
		f
		(lambda (x)
			(f ((repeated f (- n 1)) x)))))



(define (repeated f n)
	(define (iter i g)
		(if (= i 1)
			g
			(iter (- i 1)
				  (lambda (x) (f (g x))))))
	(iter n f))



(define (repeated f n)
	(define (iter i g)
		(if (= i 1)
			g
			(iter (- i 1)
				  (compose f g))))
	(iter n f))

(define (compose f g)
	(lambda (x) (f (g x))))