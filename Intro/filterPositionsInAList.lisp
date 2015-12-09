(defun read-lines ()
  (loop :for n := (read t nil) :while n :collect n))

(defun f (list &optional (n 0))
  (cond
    ((null list)                  
     nil)
    ((oddp n) (cons (first list) (f (rest list) (+ n 1))))
    (t (f (rest list) (+ n 1)))))
                                            
(format t "~{~a~^~%~}" (f (read-lines)))