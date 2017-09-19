(define (expmod base exp m)
	(cond ((= exp 0) 1)
		  ((even? exp)
		  	(remainder (square (expmod base (/ exp 2) m)) 
		  				m))
		  (else
		  	(remainder (* base (expmod base (- exp 1) m)) 
		  				m))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		  ((fermat-test n) (fast-prime? n (- times 1)))
		  (else false)))


(define (prime? n)
	(fast-prime? n 10))

(define (next-odd n)
	(if (odd? n)
		(+ 2 n)
		(+ 1 n)))

(define (continue-primes n count)
	(cond ((= count 0) (display "are prime."))
		  ((prime? n)
		  	(display n)
		  	(newline)
		  	(continue-primes (next-odd n) (- count 1)))
		  (else (continue-primes (next-odd n) count))))

(define (search-for-primes n count)
	(let ((start-time (real-time-clock)))
		 (continue-primes n count)
		 (- (real-time-clock) start-time)))
