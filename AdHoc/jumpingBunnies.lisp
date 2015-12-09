(defun read-list () 
    (loop :for n := (read t nil) :while n :when n :collect n))

(read)
(format t "~a" (reduce #'(lambda (x y)
                            (lcm x y)) (read-list)))