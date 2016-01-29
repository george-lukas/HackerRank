(defun solver (a)
  (cond 
    ((oddp a) (format t "Weird"))
    ((and (evenp a)  (and (>= a 6) (<= a 20))) (format t "Weird"))
    (t (format t "Not Weird")) ))

(solver (read))