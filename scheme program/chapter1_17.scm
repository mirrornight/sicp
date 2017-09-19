;(define (double a)
;	(+ a a))

;(define (halve b)
;	(/ b 2))

;(define (multi a b)
;	(cond ((= b 0) 0)
;		  ((= b 1) a)
;		  ((even? b) (+ (double a)
;		  				(multi (double a)
;		  				   (halve (- b 2)))))
;		  (else (+ (double a)
;		  		   a
;		  		   (multi (double a)
;		  		   	  (halve (- b 1 2)))))))

;(define (even? n)
;	(= (remainder n 2) 0))

(define (double a)
	(+ a a))

(define (halve b)
	(/ b 2))

;(define (multi a b)
;	(cond ((= b 0) 0)
;		  ((even? b) (+ (double a)
;		  				(multi (double a)
;		  				   (halve (- b 2)))))
;		  (else (+ a
;		  		   (multi a
;		  		   	      (- b 1))))))

(define (even? n)
	(= (remainder n 2) 0))

(define (multi a b)
	(cond ((= b 0)
		    0)
	      ((even? b)
	      	(double (multi a (halve b))))
	      (else (+ a (multi a (- b 1))))))