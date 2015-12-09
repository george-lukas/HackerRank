(defun sums-powers (x n &optional (aux 1))
  (cond
   ((zerop x) 1)
   ((< x 0) 0)
   ((> (expt aux n) x) 0)
   (t (+ (sums-powers x n (1+ aux))
		 (sums-powers (- x (expt aux n)) n (1+ aux))))))

(format t "~a" (sums-powers (read) (read)))