(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divides? test-divisor n) test-divisor)
		  (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
	(= n (smallest-divisor n)))
;is prime?

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (real-time-clock) start-time))
		(search-for-primes (+ n 2))))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (search-for-primes n)
	(cond ((even? n) (search-for-primes (+ n 1)))
		  (else (timed-prime-test n))))