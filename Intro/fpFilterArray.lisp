(defun read-list ()
  "Read-listV2"
  (let ((n (read *standard-input* nil)))
    (if (null n)
	nil
	(cons n (read-list)))))

(defun my-filter (f list) 
    (cond
    ((not list)                   
     nil)
    ((> f (first list))     
     (cons (first list) (my-filter f (rest list))))
    (t                         
     (my-filter f (rest list)))))

 (format t "~{~A~^~%~}" (my-filter (read) (read-list)))