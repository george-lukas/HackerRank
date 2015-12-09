(defun factors (n &aux (lows '()) (highs '()))
  (do ((limit (1+ (isqrt n))) (factor 1 (1+ factor)))
      ((= factor limit)
       (when (= n (* limit limit))
         (push limit highs))
       (remove-duplicates (nreconc lows highs)))
    (multiple-value-bind (quotient remainder) (floor n factor)
      (when (zerop remainder)
        (push factor lows)
        (push quotient highs)))))

(defun read-n-lines-to-list ()
  (loop :repeat (read)
        :for line := (read-line t nil) :while line
        :collect (read-from-string (format nil "(~A)" line))))

(dolist (x (read-n-lines-to-list))
  (format t "~D~%" (length (factors (apply #'gcd x)))))