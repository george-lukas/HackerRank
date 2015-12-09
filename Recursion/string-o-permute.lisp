(defun string-o-permute (lst)
  (cons (first (rest lst)) 
	(cons (first lst) 
	      (if (rest (rest lst))
		  (string-o-permute (rest (rest lst)))))))

(dotimes (i (read))
    (format t "~{~a~}~%" (string-o-permute (coerce (read-line) 'list)))