(defun triangle-row (size row)
  (loop for i from (1+ row) below size do (format t "_"))
  (loop for i from 1 to (1+ (* 2 row)) do (format t "1"))
  (loop for i from (1+ row) below size do (format t "_")))

(defun sierpinski-row (size row depth)
  (if (zerop depth)
      (triangle-row size row)
      (if (< row (/ size 2))
	  (progn 
	    (dotimes (n (/ size 2)) (format t "_"))
	    (sierpinski-row (/ size 2) row (1- depth))
	    (dotimes (n (/ size 2)) (format t "_")))
	  (progn 
	    (sierpinski-row (/ size 2) (- row (/ size 2)) (1- depth))
	    (format t "_")
	    (sierpinski-row (/ size 2) (- row (/ size 2)) (1- depth))))))

(defun sierpinski-triangle (depth)
  (let ((s (expt 2 5)))
    (loop :for i :below  s do
       (sierpinski-row s i depth)
       (format t "~%"))))

(sierpinski-triangle (read))