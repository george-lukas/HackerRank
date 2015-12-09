(let ((p (coerce (read-line) 'list))
        (q (coerce (read-line) 'list)))
                        (mapcar (lambda (p1 q1) (princ p1) (princ q1)) p q))