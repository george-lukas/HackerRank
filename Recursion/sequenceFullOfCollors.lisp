(defun full-of-colors (n &optional (r-min-g 0) (y-min-b 0))
    (loop for i across n do 
        (cond 
	       ((string= i "R") (setf r-min-g (1+ r-min-g)))
	       ((string= i "G") (setf r-min-g (1- r-min-g)))
	       ((string= i "Y") (setf y-min-b (1+ y-min-b)))
	       ((string= i "B") (setf y-min-b (1- y-min-b))))
        (when (not (or (<= -1 r-min-g 1)
		                   (<= -1 y-min-b 1)))
	         (return-from full-of-colors nil)))
   (return-from full-of-colors (and (= r-min-g 0) (= y-min-b 0))))


(loop :repeat (read) :do (format t "~a~%"  
		                                (if (full-of-colors (read-line))
			                                    "True" "False")))