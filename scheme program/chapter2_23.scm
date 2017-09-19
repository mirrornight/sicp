;(define (for-each proc items)
;    (if (not (null? items))
;	    (proc (car items)))
;	(if (not (null? items))
;		(for-each proc (cdr items))))

(define (for-each proc items)
	(if (not (null? items))
		(begin
			(proc (car items))
			(for-each proc (cdr items)))))

