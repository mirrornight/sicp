(define (make-account balance password)
	(define (withdraw amount)
		(if (>= balance amount)
			(begin (set! balance (- balance amount))
				   balance)
			"Insufficient funds"))

	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)

	(define (display-wrong-password-message x)
		(display "Incorrect password"))

	(define (dispatch word m)
		(if (eq? word password)
		    (cond ((eq? m 'withdraw) withdraw)
			      ((eq? m 'deposit) deposit)
			      (else
			  	     (error "Unknown request -- MAKE-ACCOUNT" m)))
		    (make-monitored display-wrong-password-message)))

	(define times-called 0)
    
	(define (make-monitored f)
		(if (>= times-called 2)
			(call-the-cops)
			(begin (set! times-called (+ times-called 1))
				   display-wrong-password-message)))

	dispatch)

;由于不能接受一个参数，引发错误
(define (call-the-cops)
    	(display "put you hands up!"))

