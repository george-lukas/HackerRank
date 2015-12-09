(defun fib (n)
  (declare (optimize (speed 3) (safety 0) (debug 0)))
  (check-type n fixnum)
  (let ((a 0) (b 1)  ;;; the matrix to exponentiate
	(p 0) (q 1)) ;;; the seed vector to which to apply it
    (loop
       for c = (+ a b)
       until (zerop n)
       when (oddp n)
       do (psetq p (+ (* a p) (* b q))
		 q (+ (* b p) (* c q))) ;;; applying the current matrix
       do (psetq n (ash n -1) ;;; halving the exponent
		 a (+ (* a a) (* b b))
		 b (* b (+ a c))) ;;; squaring the current matrix
       finally (return p))))

(defun main ()
  (loop :repeat (read) :do 
    (format t "~a~%" (mod (fib (read)) 100000007))))

(main)