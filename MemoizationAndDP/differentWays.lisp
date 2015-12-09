(defun fat (n &optional (aux 1))
  (if (<= n 1)
      aux
      (fat (- n 1) (* n aux))))

(defun combination (n r)
  (/ (fat n) (* (fat (- n r)) (fat r))))

(defun solve (n k)
  (cond ((zerop k) 1)
      ((eq n k) 1)
      (t (combination n k))))

(loop :repeat (read) :do 
  (format t "~a~%" (mod (solve (read) (read)) 100000007)))