;;;; 14.lisp - 30 Days of code: Closest Numbers
;;;; George Lukas < last update: Jan/16/2016 - 12:15PM >

;;; Helper functions
(defun pair-up (xs ys)
  (mapcar #'list xs ys))

(defun diff (xs)
  (abs (apply #'- xs)))

;;; Solver
(defun solver (xs)
  (let* ((it (sort xs #'<))
	 (it (pair-up it (rest it)))
	 (it (sort it #'< :key #'diff))
         (it (remove (diff (first it))
		     it
		     :key #'diff
		     :test #'/=)))
    (sort it #'< :key #'first)))

;;; Input/Output 
(defun read-lines ()
  (loop :repeat (read) :collect (read)))

(defun print-answer (xs)
  (format t "~{~{~A ~A~}~^ ~}" xs))

(print-answer (solver (read-lines)))
