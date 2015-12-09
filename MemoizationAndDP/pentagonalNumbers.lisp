(defun solve (n)
    (format t "~a~%"  (/ (* n (- (* 3 n) 1)) 2)))

(loop :repeat (read) :do (solve (read)))