;(define (make-rat n d)
;	(let ((g (gcd n d)))
;		(cons (/ n g) (/ d g))))

(define (make-rat n d)
	(let ((g (gcd n d)))
        (if (< d 0)
		  	(cons (/ (- n) g) (/ (- d) g))
		  	(cons (/ n g) (/ d g)))))
