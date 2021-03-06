(define (half-adder a b s c)
	(let ((d (make-wire))
		  (e (make-wire)))
		(or-gate a b d)
		(and-gate a b c)
		(inverter c e)
		(and-gate d e s)
		'ok))

(define (full-adder a b c-in sum c-out)
	(let ((s (make-wire))
		  (c1 (make-wire))
		  (c2 (make-wire)))
		(half-adder b c-in s c1)
		(half-adder a s sum c2)
		(or-gate c1 c2 c-out)
		'ok))

(define (ripple-carry-adder list-A list-B list-S c)
	(define (iter A B S value-c)
		(if (and (null? A) (null? B) (null? S))
			'ok
			(let ((ak (car A))
			  	  (bk (car B))
			  	  (sk (car S))
			  	  (remain-a (cdr A))
			  	  (remain-b (cdr B))
			  	  (remain-s (cdr S))
			  	  (ck (make-wire)))
		      	(set-signal! ck value-c)
		      	(full-adder ak bk ck sk c)
		      	(iter remain-a remain-b remain-s (get-signal c)))))
	(iter list-A list-B list-S (get-signal c)))

