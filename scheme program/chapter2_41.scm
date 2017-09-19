;(define (unique-pairs n)
;	(flatmap 
;		(lambda (i)
;		 	    (map (lambda (j) 
;		 	     			 (map (lambda (k)
;		 	     			 	          (list i j k))
;		 	     			      (enumerate-interval 1 (- j 1))))
;		 	         (enumerate-interval 1 (- i 1))))
;		(enumerate-interval 1 n)))

(define (three-pairs n)
	(define (unique-pairs n)
	(flatmap 
		(lambda (i)
		 	    (map (lambda (j) 
		 	     			 (map (lambda (k)
		 	     			 	          (list i j k))
		 	     			      (enumerate-interval 1 (- j 1))))
		 	         (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))
	(accumulate append '() (unique-pairs n)))

(define (sum-i-j-k n s)
	(filter (lambda (pair) (sum-s? pair s))
		    (three-pairs n)
		    ))

(define (sum-s? pair s)
	(if (= s (+ (car pair) (cadr pair) (caddr pair)))
		#t
		#f))

