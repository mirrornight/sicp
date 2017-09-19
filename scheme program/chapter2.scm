(define (make-rat n d) (cons n d))

(define (number x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
	(newline)
	(display (number x))
	(display "/")
	(display (denom x)))