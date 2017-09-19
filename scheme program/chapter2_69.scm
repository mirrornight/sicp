(define (generate-huffman-tree pairs)
	(successive-merge (make-leaf-set pairs)))

(define (successive-merge merge-pairs)
	(if (= 1 (length merge-pairs))
		(car merge-pairs)
		(successive-merge (adjoin-set (make-code-tree (car merge-pairs)
			                                          (cadr merge-pairs))
		                              (cddr merge-pairs)))))