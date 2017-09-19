(define (encode message tree)
	(if (null? message)
		'()
		(append (encode-symbol (car message) tree)
			    (encode (cdr message) tree))))

(define (encode-symbol x tree)
	(define (encode-1 x tree result)
		(let ((left (left-branch tree))
			  (right (right-branch tree)))
		     (if (leaf? tree)
		     	 result
			     (if (memq? x (symbols left))
			 	     (cons 0 (encode-1 x left result))
			 	     (cons 1 (encode-1 x right result))))))
	(encode-1 x tree '()))


(define (memq? item x)
	(cond ((null? x) #f)
		  ((eq? item (car x)) #t)
		  (else (memq item (cdr x)))))