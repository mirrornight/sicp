(define (equal? a b)
	(cond ((and (symbol? a) (symbol? b)) (equal-symbol? a b))
		  ((and (list? a) (list? b)) (equal-list? a b))
		  (else #f)))

(define (equal-symbol? a b)
	(eq? a b))

(define (equal-list? a b)
	(cond ((and (null? a) (null? b)) #t)
		  ((or (null? a) (null? b)) #f)
		  ((eq? (car a) (car b)) (equal-list? (cdr a) (cdr b)))
		  (else #f)))