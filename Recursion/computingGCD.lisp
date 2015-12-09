(defun my-gcd (a b)
    (if (zerop b)
        a
        (my-gcd b(mod a b))))

(format t "~d" (my-gcd (read) (read)))