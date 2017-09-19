(define (make-joint account account-password other-password)
	(lambda (new-password message)
		(if (eq? other-password new-password)
			(account account-password message)
			(error "fail" new-password))))