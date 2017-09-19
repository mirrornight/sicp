;(define (make-center-percent c p)
;	(make-interval (- c (* c (/ p 100))) (+ c (* c (/ p 100)))))
(define (make-center-percent c p)
	(let ((width (* c (/ p 100.0))))
		(make-interval (- c width) (+ c width))))

(define (center i)
	(/ (+ (lower-bound i) (upper-bound i)) 2.0))

(define (percent i)
	(* 100 (/ (- (upper-bound i) (lower-bound i)) (center i) 2.0)))
