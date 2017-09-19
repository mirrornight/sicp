;(define (lookup key-list table)
;	(let ((subtable (assoc (car key-list) (cdr table))))
;		(if subtable
;			(if (not (pair? (cdr subtable)))
;				(cdr subtable)
;				(lookup (cdr key-list) subtable))
;			false)))

(define (lookup key-list table)
	(cond ((null? key-list)
		    (cdr table))
	      (else
	      	(let ((next (assoc (car key-list) (cdr table))))
	      		(if next
	      			(lookup (cdr key-list) next)
	      			false)))))

(define (assoc key records)
	(cond ((null? records) false)
		  ((equal? key (caar records))
		  	(car records))
		  (else
		  	(assoc key (cdr records)))))

(define (insert! key-list value table)
	(define (add-to-table key-list value)
		(cond ((null? (cdr key-list))
				(cons (car key-list) value))
		      (else
		      	(list (car key-list)
		      		  (add-to-table (cdr key-list) value)))))
	(let ((next (assoc (car key-list) (cdr table))))
		(if next
			(if (not (pair? (cdr next)))
				(set-cdr! next value)
				(insert! (cdr key-list) value next))
			(set-cdr! table
				      (cons (add-to-table key-list value)
				      	    (cdr table)))))
	table)

(define (add-to-table key-list value)
		(cond ((null? (cdr key-list))
				(cons (car key-list) value))
		      (else
		      	(list (car key-list)
		      		  (add-to-table (cdr key-list) value)))))


