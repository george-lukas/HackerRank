;;;; hackerRank: Prision transport

(defvar *n* (read))
(defvar *m* (read))

(defvar *arr* (make-array (1+ *n*) :initial-element -1))

(defun find-parent (index &optional (val nil val-supplied-p))
  (if (null val-supplied-p)
    (if (= index (aref *arr* index))
      index
      (find-parent (aref *arr* index)))
    (let ((pa (aref *arr* index)))
      (when (/= val pa)
        (setf (aref *arr* index) val)
        (find-parent pa val)))))

(dotimes (i (1+ *n*))
    (setf (aref *arr* i) i))

(dotimes (i *m*)
  (let* ((a (read))
         (b (read))
         (pa (find-parent a))
         (pb (find-parent b)))
    (let ((lab (max pa pb)))
         (find-parent a lab)
	 (find-parent b lab))))
         
(loop :for i :from *n* :downto 1
      :do (let ((pa (find-parent i)))
	    (setf (aref *arr* i) pa)))

(defvar *tab* (make-hash-table))

(loop :for i :from 1 :to *n*
      :do (incf (gethash (aref *arr* i) *tab* 0)))

(let ((cost 0))
  (with-hash-table-iterator (it *tab*)
    (loop
       (multiple-value-bind (got-one key value) (it)
	 (if got-one
	     (incf cost (ceiling (sqrt value)))
	     (return)))))
  (format t "~a~%" cost))
