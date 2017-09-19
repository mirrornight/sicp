(define (make-simplified-withdraw balance)
	(lambda (amount)
		(set! balance (- balance amount))
		balance))

(define w (make-simplified-withdraw 25))

(define (make-decrementer balance)
	(lambda (amount)
		(- balance amount)))

