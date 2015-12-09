(let* ((s (read-line)))
     (format t "~a" (remove-duplicates s :test #'char-equal :from-end t)))