(define (square-tree tree)
	(tree-map square tree))

(define (tree-map proc tree)
	(cond ((null? tree) '())
		  ((not (pair? tree)) (proc tree))
		  (else (cons (square-tree (car tree))
		  	          (square-tree (cdr tree))))))