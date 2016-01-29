(defvar a (read))
(defvar b (read))
(defvar c (read))

(defun tip (a b)
  (/ (* b a) 100))

(defun tax (a b)
    (/ (* a b) 100))

(format t "The final price of the meal is $~a." (round (+ (tip b a) (tax c a) a)))