(segments->painter (list top bottom left right))

(define top (make-segment top-left top-right))

(define top-left (make-vect 0.0 1.0))

(define top-right (make-vect 1.0 1.0))

(define bottom (make-segment bottom-left bottom-right))

(define bottom-left (make-vect 0.0 0.0))

(define bottom-right (make-vect 1.0 0.0))

(define left (make-segment bottom-left top-left))

(define right (make-segment bottom-right top-right))

;----------------------------------------------------------

(segments->painter (list x1 x2))

(define x1 (make-segment xv1 xv2))

(define xv1 (make-vect 0.0 1.0))

(define xv2 (make-vect 1.0 0.0))

(define x2 (make-segment xv3 xv4))

(define xv3 (make-vect 0.0 0.0))

(define xv4 (make-vect 1.0 1.0))

;--------------------------------------------------------------

(segments->painter (list left-bottom left-top right-bottom right-top))

(define left-bottom (make-segment left-mid-point bottom-mid-point))

(define left-mid-point (make-vect 0.0 0.5))

(define bottom-mid-point (make-vect 0.5 0.0))

(define left-top (make-segment left-mid-point top-mid-point))

(define top-mid-point (make-vect 0.5 1.0))

(define right-bottom (make-segment bottom-mid-point right-mid-point))

(define right-mid-point (make-vect 1.0 0.5))

(define right-top (make-segment top-mid-point right-mid-point))