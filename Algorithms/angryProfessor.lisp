(dotimes (_ (read)) ; Number of test cases
  (let ((n (read)) ; number of students to come
        (k (read))) ; minimum number of students present before the class starts
    (loop :repeat n
          :counting (<= (read) 0) :into counter
          :finally (return (format t "~&~:[NO~;YES~]~%" (< counter k)))))