;;; hackerRank: Convex Hull

#| -- Pseudo-code
Input: a list P of points in the plane.

Sort the points of P by x-coordinate (in case of a tie, sort by y-coordinate).

Initialize U and L as empty lists.
The lists will hold the vertices of upper and lower hulls respectively.

for i = 1, 2, ..., n:
    while L contains at least two points and the sequence of last two points
            of L and the point P[i] does not make a counter-clockwise turn:
        remove the last point from L
    append P[i] to L

for i = n, n-1, ..., 1:
    while U contains at least two points and the sequence of last two points
            of U and the point P[i] does not make a counter-clockwise turn:
        remove the last point from U
    append P[i] to U

Remove the last point of each list (it's the same as the first point of the other list).
Concatenate L and U to obtain the convex hull of P.
Points in the result will be listed in counter-clockwise order. --|#


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


