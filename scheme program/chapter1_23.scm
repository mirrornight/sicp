(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divides? test-divisor n) test-divisor)
		  (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (next test-divisor)
	(if (= test-divisor 2) 
		3
		(+ test-divisor 2)))

(define (prime? n)
	(= n (smallest-divisor n)))

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