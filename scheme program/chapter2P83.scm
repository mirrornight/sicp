;这个函数的功能是从列表中的第一个元素开始用op与后面的元素和 initial 作用在一起
(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence)
			(accumulate op initial (cdr sequence)))))

;过滤器，predicate
(define (filter predicate sequence)
	(cond ((null? sequence) '())
		  ((predicate (car sequence))
		   (cons (car sequence)
		   	     (filter predicate (cdr sequence))))
		  (else (filter predicate (cdr sequence)))))

;枚举出low到high的每个元素
(define (enumerate-interval low high)
	(if (> low high)
		'()
		(cons low (enumerate-interval (+ low 1) high))))

;将列表中的每个元素用p作用后返回一个新列表，若列表中无元素，则返回一个空列表
(define (map p sequence)
	(accumulate (lambda (x y)
		                (cons (p x) y))
	            '()
	            sequence))

;将两个列表合并返回一个新列表
(define (append seq1 seq2)
	(accumulate cons seq2 seq1))
;--------------------------------------------------------------------------

(define (flatmap proc seq)
	(accumulate append '() (map proc seq)))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
	(map make-pair-sum
		 (filter prime-sum?
		 	     (flatmap 
		 	     	(lambda (i)
		 	     		(map (lambda (j) 
		 	     			         (list i j))
		 	     		     (enumerate-interval 1 (- i 1))))
		 	     	(enumerate-interval 1 n)))))

;-------------------------------------------------------------------------
(define (permutations s)
	(if (null? s)
		(list '())
		(flatmap (lambda (x)
			             (map (lambda (p) (cons x p))
			             	  (permutations (remove x s))))
		         s)))

(define (remove item sequence)
	(filter (lambda (x) (not (= x item)))
		    sequence))

