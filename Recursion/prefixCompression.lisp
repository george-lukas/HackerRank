(defun compress (x y)
  (let ((div (do ((i 1 (1+ i)))
			((or (> i (length x))
			     (> i (length y))
			     (string/= (subseq x (1- i) i) (subseq y (1- i) i)))
			 (1- i)))))
    (list (subseq x 0 div)
	  (subseq x div)
	  (subseq y div))))

(defun print-lists (l)
  (let ((p (first l))
	(x (second l))
	(y (third l)))
    (format t "~a ~a~%~a ~a~%~a ~a~%"
	    (length p) p
	    (length x) x
	    (length y) y)))

(print-lists (compress (string (read-line)) (string (read-line))))