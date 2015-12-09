(defun f (n)
  (declare (type double-float n)) 
  (loop for i from 0 below n 
       :sum (/ n (- n i))))

(format t "~f" (f (coerce (* (read) (read)) 'double-float)))
