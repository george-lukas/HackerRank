(defun fat (n &optional (aux 1))
  (if (<= n 1)
      aux
      (fat (- n 1) (* n aux))))

(defun taylor (x)
  (float (loop :for n 
               :from 0 :to 9 
               :sum (/ (expt x n) (fat n)))))

(loop :repeat (read) :do (format t "~,4f~%" (taylor (read))))