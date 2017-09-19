(define (union-tree tree1 tree2)
	(list->tree (union-set (tree->list-2 tree1)
		                   (tree->list-2 tree2))))


(define (union-set set1 set2)
	(cond ((null? set1) set2)
		  ((null? set2) set1)
		  (else (let ((x1 (car set1)) (x2 (car set2)))
		  			(cond ((= x1 x2)
                           (cons x1 (union-set (cdr set1) (cdr set2))))
		  			      ((< x1 x2)
		  			       (cons x1 (union-set (cdr set1) set2)))
		  			      ((> x1 x2)
		  			       (cons x2 (union-set set1 (cdr set2)))))))))

(define (intersection-tree tree1 tree2)
	(list->tree (intersection-set (tree->list-2 tree1)
		                          (tree->list-2 tree2))))