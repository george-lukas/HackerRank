;;; hackerRank: Convex Hull

;;; (distance 'list 'list) -> float
(defun distance (x y)
  "The Euclidean distance between two points.
     The points are coordinates in n-dimensional space."
  (sqrt (reduce #'+ (mapcar #'(lambda (a b) (expt (- a b) 2)) x y))))


;;;  (PERIMETER '((1 1) (5 3) (2 5))) -> 12.2
(defun perimeter (sorted-list)
  "Calcula o perimetro da lista gerada pelo Convex Hull."
  (loop :for prev := (first (last sorted-list)) :then curr
     :for curr :in sorted-list :sum (distance prev curr)))

(defun outer-product (p0 p1 p2)
  (let ((x0 (first p0)) (y0 (second p0))
        (x1 (first p1)) (y1 (second p1))
        (x2 (first p2)) (y2 (second p2)))
    (- (* (- x1 x0) (- y2 y0))
       (* (- y1 y0) (- x2 x0)))))

;;; (CONVEX-HULL '((1 1) (2 5) (3 3) (5 3) (3 2) (2 2))) -> ((1 1) (5 3) (2 5))
(defun convex-hull (pts)
  "Calculates the convex hull given a set of points in the cartesian plane
     using 'Monotone-Chain Algorithm'. Performance is O(n lg n) time."
  (let ((sorted (sort 
		 (copy-list pts)
		 (lambda (p1 p2) (or (< (first p1) (first p2))
				     (and (= (first p1) (first p2))
					  (< (second p1) (second p2))))))))
    (when (<= (length sorted) 3)
      (return-from convex-hull sorted)) ; Points in the result will be listed in counter-clockwise order.
;; Below is upper hull.    
    (let ((upper (list (second sorted) (first sorted))))
      (loop :for p :in (rest (rest sorted))
	 :do (push p upper)
	 (loop :for (p0 p1 p2 . ps) := upper
	    :until (or (not p2)
		       (minusp (outer-product p0 p1 p2)))
	    :do (setf upper (cons p0 (cons p2 ps)))))
;; Below is lower hull. 
      (let* ((rev-sorted (reverse sorted))
             (lower (list (second rev-sorted) (first rev-sorted))))
        (loop :for p :in (rest (rest rev-sorted))
	   :do (push p lower)
	   (loop :for (p0 p1 p2 . ps) := lower
	      :until (or (not p2)
			 (minusp (outer-product p0 p1 p2)))
	      :do (setf lower (cons p0 (cons p2 ps)))))
;; Below Concatenate Lower and Upper to obtain the convex hull of P.	
        (nreconc upper (rest (nreverse (rest lower))))))))
	  

;;; hackerRank input
(defun parse-point (string)
  (multiple-value-bind (x pos) (parse-integer string :junk-allowed t)
    (list x (parse-integer string :start (1+ pos) :junk-allowed t))))

(defun main ()
  (let ((points (loop :repeat (read) :collect (parse-point (read-line)))))
    (format t "~,1f" (perimeter (convex-hull points)))))

(main)
