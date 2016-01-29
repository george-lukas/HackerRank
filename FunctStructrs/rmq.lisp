;;;; hackerRank: Range Minimum Query

(defvar *n* (read))
(defvar *q* (read))

(defvar arr (make-array *n* :initial-element nil))

(dotimes (i *n*)
  (setf (aref arr i) (read)))

(defstruct node 
  val
  lb
  rb
  left-child
  right-child)

;;; construct the segment tree
(defun construct-segment-tree (l r)
  (if (= l r)
    (make-node 
     :val (aref arr l)
     :lb l
     :rb r
     :left-child ()
     :right-child ())
    
    (let* ((mid (truncate (/ (+ l r) 2)))
	   (left-tree (construct-segment-tree l mid))
	   (right-tree (construct-segment-tree (1+ mid) r))
	   (left-val (node-val left-tree))
	   (right-val (node-val right-tree))
	   (new-node (make-node
		      :val (min left-val right-val)
		      :lb l
		      :rb r
		      :left-child left-tree
		      :right-child right-tree)))
      new-node)))

(defvar my-tree (construct-segment-tree 0 (1- *n*)))

(defvar *infinity* 1000000)

(defun print-tree (tree)
  (if tree
    (progn
      (format t "~a " (node-val tree))
      (print-tree (node-left-child tree))
      (print-tree (node-right-child tree)))))

(defun query (node qlb qrb)
  (let ((lb (node-lb node))
        (rb (node-rb node)))
    (cond 
      ((and (<= rb qrb)(>= lb qlb))
       (node-val node))
      ((or (< rb qlb) (> lb qrb))
       *infinity*)
      (t (let* ((res1 (query (node-left-child node) qlb qrb))
		(res2 (query (node-right-child node) qlb qrb)))
	   (min res1 res2))))))

(dotimes (i *q*)
   (let ((qlb (read))
         (qrb (read)))
      (format t "~a~%" (query my-tree qlb qrb))))
