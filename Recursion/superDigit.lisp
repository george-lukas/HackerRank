(defun super-digit (n)
  "Lembrando que mod 9 eh o msm que a soma dos digitos"
  (if (zerop (mod n 9)) 
      9
      (mod n 9)))

(defun result ()
  (let ((s (* (read) (read))))
    (format t "~a~%" (super-digit s))))

(result)