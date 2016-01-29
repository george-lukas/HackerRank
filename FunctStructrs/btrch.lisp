(defconstant +undecided+ 0)
(defconstant +win+ 1)
(defconstant +loss+ 2)
(defvar +dimensions+ '(26 26 26))

(defun bite (coords i x)
  (loop :for coord :in coords
        :for i-coord :from 0
        :collect (if (< i-coord i)
		     coord
		     (min coord x))))

(let ((field (make-array +dimensions+ :element-type '(mod 3) :initial-element +undecided+)))
  (setf (row-major-aref field 0) +win+)
  (defun loss? (coords)
    (let ((answer #1=(apply #'aref field coords)))
      (if (/= answer +undecided+) answer
          (setf #1#
                (block loop
                  (dotimes (i (length coords))
                    (dotimes (x (elt coords i))
                      (when (= +loss+ (loss? (bite coords i x)))
                        (return-from loop +win+))))
                  +loss+))))))

(defun read-many (n)
  (loop :repeat n :collect (read)))

(defun main ()
  (dotimes (i (read))
    (format t "~a~%" (if (= +loss+ (loss? (read-many 3)))
                         "LOSE" "WIN"))))
(main)
