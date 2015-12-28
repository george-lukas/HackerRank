;;; bfintpr.lisp - hackerRank: Brainf_ck Interpreter
;;; George Lukas < 27/Dec/2015 11:45AM >

(read-line)

(defvar *input* (mapcar #'char-code (coerce (string-right-trim "$" (read-line)) 'list)))
(defvar *tape* (make-array 30000 :element-type '(mod 256)))
(defvar *i* 0)

(defvar *max* 100000)

(defun time-out ()
  (when (minusp (decf *max*))
    (format t "~%PROCESS TIME OUT. KILLED!!!~%")
    (exit)))

(defun bf< () (decf *i*))
(defun bf> () (incf *i*))
(defun bf+ () (setf (aref *tape* *i*) (logand 255 (1+ (aref *tape* *i*)))))
(defun bf- () (setf (aref *tape* *i*) (logand 255 (1- (aref *tape* *i*)))))
(defun bf@ () (setf (aref *tape* *i*) (first *input*) *input* (rest *input*)))
(defun bf. () (princ (code-char (aref *tape* *i*))))

(defun bfintpr (src)
  (mapc #'(lambda (x) (typecase x
			(function (time-out) (funcall x))
			(cons (time-out) (if (zerop (aref *tape* *i*)) (time-out) (bfintpr x)))
			(null (exit)))) src)
  (time-out) (when (plusp (aref *tape* *i*)) (time-out) (bfintpr src)))

(bfintpr (labels ((src ()
	       (let ((char (read-char-no-hang *standard-input* nil)))
		 (if char
		     (case char
		       (#\] '(l))
		       (#\[ (cons (src) (src)))
		       (#\< (cons #'bf< (src)))
		       (#\> (cons #'bf> (src)))
		       (#\+ (cons #'bf+ (src)))
		       (#\- (cons #'bf- (src)))
		       (#\, (cons #'bf@ (src)))
		       (#\. (cons #'bf. (src)))
		       (t   (src)))
		     '(nil))))) (src)))
