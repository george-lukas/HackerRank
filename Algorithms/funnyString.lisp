(defun funnyp (str)
  (let ((reversed-str (reverse str)))
       (loop :for i :from 1 :below (length str)
	         :always (= (abs (- (char-code (char str i)) (char-code (char str (1- i)))))
			            (abs (- (char-code (char reversed-str i)) (char-code (char reversed-str (1- i)))))))))

(loop :repeat (read) :do
  (format t "~[Funny~;Not Funny~]~&" (if (funnyp (read-line)) 0 1)))