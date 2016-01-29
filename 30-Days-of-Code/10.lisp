;;;; 10.lisp - 30 Days of Code: Day 10: Binary Numbers!
;;;; George Lukas < last update: Jan/10/2016 - 12:16PM >

(defun read-lines ()
  (loop :repeat (read) :collect (read)))
  
(defun solver ()
  (format t "~{~b~^ ~%~}" (read-lines)))

#+
(or)
(defun solver ()
  (loop :repeat (read) :do (format t "~b ~%" (read))))
