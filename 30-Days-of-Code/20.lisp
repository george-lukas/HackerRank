(defun punctuation-p (char) (find char "[!,?.\_'@]+"))

(defun read-line-no-punct ()
  "Read an input line, ignoring punctuation."
  (read-from-string
    (concatenate 'string "(" (substitute-if #\space #'punctuation-p
                                            (read-line))
                 ")")))

(defun print-lines (lst)
  (format t "~d ~%~@(~a ~)~%~{~(~A~)~%~}" (length lst) (first lst) (rest lst)))

(print-lines (read-line-no-punct))

