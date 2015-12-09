(defun f (n list)
    (mapcan (lambda (x) (make-list n :initial-element x)) list))

(defun read-list ()
    (let ((n (read *standard-input* nil)))
        (if (null n)
            nil
            (cons n (read-list)))))

(format t "~{~d~%~}" (f (read) (read-list)))