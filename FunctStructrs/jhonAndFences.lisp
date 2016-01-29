(defvar *heights* (loop :repeat (read) :collecting (read)))

(defun area (h w) (* h w))

(defun process-heights (heights stack fence-count max-area)
  (if heights
      (let* ((this-height (first heights))
             (remaining-heights (rest heights))
             (rest-of-stack (rest stack))
             (top-of-stack-height (if stack (caar stack) 0))
             (top-of-stack-start (if stack (cadar stack) -1))
             (top-of-stack-start-a (if stack (caddar stack) -1)))
	(cond ((> this-height top-of-stack-height) ; push this on to stack and move on
	       (process-heights remaining-heights (cons (list this-height (1+ top-of-stack-start-a) fence-count) stack) (1+ fence-count) max-area))
	      ((< this-height top-of-stack-height) ; pop previous from stack and calculate area. don't move on
	       (let ((new-max-area (max max-area (area top-of-stack-height (- fence-count top-of-stack-start)))))
		 (process-heights heights rest-of-stack fence-count new-max-area)))
	      (t (process-heights remaining-heights 
				  (cons (list this-height top-of-stack-start fence-count) stack)
				  (1+ fence-count) max-area))))
      (if stack
          (let* ((rest-of-stack (rest stack))
                 (top-of-stack-height (caar stack))
                 (top-of-stack-start (cadar stack))
                 (new-max-area (max max-area (area top-of-stack-height (- fence-count top-of-stack-start)))))
	    (process-heights heights rest-of-stack fence-count new-max-area))
          max-area)))

(format t "~d~%" (process-heights *heights* nil 0 0))
