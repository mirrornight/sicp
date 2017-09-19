(define (make-frame origin edge1 edge2)
	(list origin edge1 edge2))

(define (origin frame) (car frame))

(define (edge1 frame) (cadr frame))

(define (edge2 frame) (caddr frame))

(define (make-frame origin edge1 edge2)
	(cons origin (cons edge1 edge2)))

(define (origin frame) (car frame))

(define (edge1 frame) (cadr frame))

(define (edge2 frame) (cddr frame))

(define (segments->painter segment-list)
	(lambda (frame)
		(for-each
			(lambda (segment)
				    (draw-line
				    	((frame-coord-map frame) (start-segment segment))
				    	((frame-coord-map frame) (end-segment segment))))
			segment-list)))

(define (frame-coord-map frame)
	(lambda (v)
		(add-vect
			(origin-frame frame)
			(add-vect (scale-vect (xcor-vect v)
				                  (edge1-frame frame))
			          (scale-vect (ycor-vect v)
			          	          (edge2-frame frame))))))