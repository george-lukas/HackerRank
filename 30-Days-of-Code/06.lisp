(defvar *n* (read))
(loop :for i :from 1 :to *n*
      :do (format t "~v<~v@{~a~:*~}~>~%" *n* i "#" ))