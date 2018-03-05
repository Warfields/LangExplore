; Author: Adam Frick

(defun collatz (n)
  (cond ((eq (car n) 1) n)
        ((eq (mod (car n) 2) 0) (append (collatz (list (/ (car n) 2))) n))
        (t (append (collatz (list (+ 1 (* 3 (car n))))) n))))

(defun longest-collatz (n)
  (let ((x 0)
       (m 0)
       (s 0))
  (loop for a from 1 to n
    do (setf x (length (collatz (list a))))
       (cond ((> x m) (setf m x) (setf s a))))
  s))

(defun main ()
  (let ((n 1000000) (user-in 0))
  (format t (concatenate 'string "This is an implementation of Euler Problem "
                         "14.~%~%It will, within a bound, find the longest "
                         "Collatz sequence chain and return its~%starting "
                         "number.~%~%The given upper bound for the problem "
                         "is one million; you may enter your own as~%" 
                         "the default takes a while to compute.~%"))
  (format t "Enter a positive integer (non-positive for default bound): ")
  (finish-output)

  (setf user-in (read))
  (if (> user-in 0) (setf n user-in))
  (format t "The starting number below ~D with the longest chain is ~D.~%"
         n (longest-collatz n))
  ) NIL)
