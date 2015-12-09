(defconstant moduler (+ 7 (expt 10 9)))

(defun mklist3 ()
  "Cria uma lista de tamanho n"
  (loop :repeat (read)
     :collect (read t)))

(format t "~a~%"
	(mod (gcd (apply #'* (mklist3))
		  (apply #'* (mklist3)))
	     moduler))