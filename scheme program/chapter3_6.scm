;每次调用rand函数都会修改x的值
;(define (rand s)
;	(let ((x 0))
;		 (cond ((eq? s 'generate)
;				(set! x (rand-update x))
;				x)
;		  	   ((eq? s 'reset) 
;		  		(lambda (init)
;		  			(set! x init)
;		  			x))
;		  	   (else (error "Unknow item" s)))))

(define random-init 0)
(define (rand-update x) (+ x 1))

(define rand
	(let ((x random-init))
		(define (dispatch s)
			(cond ((eq? s 'generate)
				(set! x (rand-update x))
				x)
		  	   ((eq? s 'reset) 
		  		(lambda (init)
		  			(set! x init)
		  			x))
		  	   (else (error "Unknow item" s))))
		dispatch))
;======================================================
(define (rand x)
	(define (dispatch s)
			(cond ((eq? s 'generate)
				(set! x (rand-update x))
				x)
		  	   ((eq? s 'reset) 
		  		(lambda (init)
		  			(set! x init)
		  			x))
		  	   (else (error "Unknow item" s))))
	dispatch)

(define rand (rand 0))