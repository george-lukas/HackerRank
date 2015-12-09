(defun get-sublist (lst1 lst2)
  "Cria uma nova lista com os elementos sobrecalentes da lista 2"
  (let ((resl lst2))
    (dolist (e lst1)
      (setf resl (delete e resl :count 1)))
    (remove-duplicates resl)))

(defun get-arg ()
  "Cria uma lista com o tamanho da entrada"
  (let ((arg nil))
    (dotimes (i (read))
      (push (read) arg))
    arg))

(defun sort-resl ()
  (sort (get-sublist (get-arg) (get-arg)) #'<))

(format t "~{~S ~}~%" (sort-resl))