;;;; daySeven.lisp - Reverse a list of N elements
;;;; George Lukas < Jan/07//2016 - 04:52PM >

(defun read-lines ()
  "Colect N elements to a list"
  (loop :repeat (read) :collect (read)))

(defun my-reverse (l &optional (aux nil))
  (if (null l) aux
      (my-reverse (rest l) (cons (first l) aux))))

(format t "~{~a ~}" (my-reverse (read-lines)))
