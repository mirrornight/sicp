(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map1 (lambda (sub-m) 
		          (dot-product sub-m v)) 
	      m))

(define (transpose mat)
	(accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
		(map1 (lambda (sub-m)
			          (matrix-*-vector cols sub-m))
		      m)))
