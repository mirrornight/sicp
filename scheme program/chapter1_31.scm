(define (factorial a b)
	(define (next x) (+ x 2))
	(define (f x) (/ (* x (+ x 2)) (square (+ x 1))))
	(* 4.0 (product f a next b)))

;(define (product term a next b)
;	(if (> a b)
;		1
;		(* (term a)
;			(product term (next a) next b))))


(define (product term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* result (term a)))))
	(iter a 1))