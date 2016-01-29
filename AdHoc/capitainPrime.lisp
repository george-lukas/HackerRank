(defun contain-zero (id)
  "Tests if N contains zero."
  (do ((n id (floor (/ n 10))))
      ((zerop n) nil)
    (when (zerop (mod n 10) ) (return-from contain-zero t))))

(defun primep (n)
  "Is N prime?"
  (and (> n 1) 
       (or (= n 2) (oddp n))
       (loop for i from 3 to (isqrt n) by 2
	  never (zerop (rem n i)))))

(defun ch-left (n)
  (mod n (expt 10 (floor (log n 10)))))

(defun leftp (id)
  (do ((n id (ch-left n)))
      ((zerop n) t)
    (when (not (is-prime n)) (return-from leftp nil))))
   
(defun rightp (id)
  (do ((n id (floor (/ n 10))))
      ((zerop n) t)
    (when (not (is-prime n)) (return-from rightp nil))))

(defun assign (id)
  (when (contain-zero id) (return-from assign 'DEAD))
  (let ((l (leftp id))
	(r (rightp id)))
    (cond 
      ((and l r) 'CENTRAL)
      (l 'LEFT)
      (r 'RIGHT)
      (t 'DEAD))))

(loop :repeat (read) :do 
  (format t "~a~%" (assign (read))))
