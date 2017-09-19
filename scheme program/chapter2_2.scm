(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment L) (car L))

(define (end-segment L) (cdr L))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (midpoint-segment L)
	(let ((x-midpoint (/ (+ (x-point (start-segment L))
		                    (x-point (end-segment L)))
	                   2))
	       (y-midpoint (/ (+ (y-point (start-segment L))
	       	                 (y-point (end-segment L)))
	                    2)))
	     (make-point x-midpoint y-midpoint)))

(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))