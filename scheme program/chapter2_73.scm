(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
   (if subtable
       (let ((record (assoc key-2 (cdr subtable))))
         (if record
         (cdr record)
         #f))
       #f)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
   (if subtable
       (let ((record (assoc key-2 (cdr subtable))))
         (if record
         (set-cdr! record value)
         (set-cdr! subtable
               (cons (cons key-2 value)
                 (cdr subtable)))))
       (set-cdr! local-table
             (cons (list key-1
                 (cons key-2 value))
               (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
       ((eq? m 'insert-proc!) insert!)
       (else (error "Unknown operation -- TABLE" m))))
    dispatch))
 
(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

;-------------------------------------------------------------------------
(define (attach-tag type-tag x y)
	(list type-tag x y))

(define (type-tag datumn)
	(car datumn))

(define (contents datumn)
	(cdr datumn))
;--------------------------------------------------------------------
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
	(and (number? exp) (= exp num)))

(define (deriv exp var)
	(cond ((number? exp) 0)
		  ((variable? exp) (if (same-variable? exp var) 1 0))
		  (else ((get 'deriv (operator exp)) (operands exp)
		  	                                 var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))
;----------------------------------------------------------------------------
;计算(deriv '(+ x 3) 'x)时，中调用的函数不是(addend sum)，而是install内部的
(define (install-sum-package)
	(define (addend s) (car s))
	(define (augend s) (cadr s))
	(define (make-sum x y)
		(cond ((=number? x 0) y)
			  ((=number? y 0) x)
			  ((and (number? x) (number? y))
			  	(+ x y))
			  (else
			  	(attach-tag '+ x y))))
	(put 'addend '+ addend)
	(put 'augend '+ augend)
	(put 'make-sum '+ make-sum)
	(put 'deriv '+
		(lambda (exp var)
			(make-sum (deriv (addend exp) var)
				      (deriv (augend exp) var))))
	'done)

(define (make-sum x y)
	((get 'make-sum '+) x y))

(define (addend sum)
	((get 'addend '+) (contents sum)))

(define (augend sum)
	((get 'augend '+) (contents sum)))

;-------------------------------------------------------------------------
(define (install-product-package)
	(define (multiplier p) (car p))
	(define (multiplicand p) (cadr p))
	(define (make-product m1 m2)
		(cond ((or (=number? m1 0) (=number? m2 0)) 0)
			  ((=number? m1 1) m2)
			  ((=number? m2 1) m1)
			  ((and (number? m1) (number? m2)) (* m1 m2))
			  (else (attach-tag '* m1 m2))))
	(put 'multiplier '* multiplier)
	(put 'multiplicand '* multiplicand)
	(put 'make-product '* make-product)
	(put 'deriv '*
		(lambda (exp var)
			(make-sum (make-product (multiplicand exp)
				                    (deriv (multiplier exp) var))
				      (make-product (multiplier exp)
				      	            (deriv (multiplicand exp) var)))))
	'done)

(define (make-product x y)
	((get 'make-product '*) x y))

(define (multiplier product)
	((get 'multiplier '*) (contents product)))

(define (multiplicand product)
	((get 'multiplicand '*) (contents product)))

;---------------------------------------------------------------------------
(define (install-exponent-package)
	(define (base e) (car e))
	(define (exponent e) (cadr e))
	(define (make-exponent e1 e2)
	(cond ((=number? e2 0) 1)
		  ((=number? e2 1) e1)
		  (else (attach-tag '** e1 e2))))
	(put 'base '** base)
	(put 'exponent '** exponent)
	(put 'make-exponent '** make-exponent)
	(put 'deriv '**
		(lambda (exp var)
			    (make-product (exponent exp)
		  	                  (make-product (make-exponent (base exp) (- (exponent exp) 1))
		  		                            (deriv (base exp) var)))))
	'done)

(define (make-exponent x y)
	((get 'make-exponent '**) x y))

(define (base p)
	((get 'base '**) (contents p)))

(define (exponent p)
	((get 'exponent '**) (contents p)))
