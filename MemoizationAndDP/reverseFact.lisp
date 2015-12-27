;;; reverseFact.lisp - hackerRank: Reverse Factorization
;;; George Lukas < Last Time Edited: 11:02PM >

(defun quotient (n m)
  (truncate (/ n m)))

(defun reverse-fact (number factors &optional (acc nil))
  (cond
    ((= 1 number) (cons 1 acc))
    ((let ((x (some #'(lambda (x) (and (zerop (rem number x)) x)) factors)))
     (if x (reverse-fact (quotient number x) factors (cons number acc)) nil))))) 

(defun print-answer (lst)
  (if (not lst)
      (format t "-1")
      (mapcan #'(lambda (x) (format t "~a " x)) lst)))

(let ((x (read)))
  (let ((y (read)))
    (print-answer (reverse-fact x (sort (loop :repeat y :collect (read)) #'>)))))
