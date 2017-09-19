(define (front-ptr queue) (car queue))

(define (rear-ptr queue) (cdr queue))

(define (set-front-ptr! queue item) (set-car! queue item))

(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-deque? queue) (null? (front-ptr queue)))

(define (make-deque) (cons '() '()))
;----------------------------------------------------------
(define (front-deque deque)
	(if (empty-deque? deque)
		(error "front called with an empty-deque" deque)
		(car (front-ptr deque))))

(define (rear-deque deque)
	(if (empty-deque? deque)
		(error "rear called with an empty-deque" deque)
		(car (rear-ptr deque))))

(define (front-insert-deque! deque item)
	(let ((new-pair (cons item '())))
		(cond ((empty-deque? deque)
		    	(set-front-ptr! deque new-pair)
		    	(set-rear-ptr! deque new-pair)
		    	deque)
	      	  (else
	      		(set-front-ptr! deque (cons item (front-ptr deque)))
	      	 	deque))))

(define (rear-insert-deque! deque item)
	(let ((new-pair (cons item '())))
		(cond ((empty-deque? deque)
				  (set-front-ptr! deque new-pair)
				  (set-rear-ptr! deque new-pair)
				  deque)
			  (else
			  	  (set-cdr! (rear-ptr deque) new-pair)
			  	  (set-rear-ptr! deque new-pair)
			  	  deque))))

(define (front-delete-deque! deque)
	(cond ((empty-deque? deque)
		     (error "DELETE! called with an empty-deque" deque))
		  (else
		  	 (set-front-ptr! deque (cdr (front-ptr deque)))
		  	 deque)))

(define (rear-delete-deque! deque)
	(define (cut-last-one L deque)
		(cond ((null? (cdr (cdr L)))
		    	(set-cdr! L '())
		    	(set-rear-ptr! deque L)
		    	deque)
		  	  (else
				(cut-last-one (cdr L) deque))))
	(cond ((empty-deque? deque)
			 (error "DELETE! called with an empty-deque" deque))
		  ((null? (cdr (front-ptr deque)))
		  	 (set-front-ptr! deque '())
		  	 deque)
	      (else
	      	 (cut-last-one (front-ptr deque) deque))))

(define (cut-last-one L s)
	(cond ((null? (cdr (cdr L)))
		    (set-cdr! L '())
		    s)
		  (else
			(cut-last-one (cdr L) s))))
