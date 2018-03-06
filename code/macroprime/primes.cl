;;;; Author: William Brickner
(load "lcomp.cl")

(defvar *x* 0)

(defun is-prime (nump)
    (if  (eq (length (lcomp x for (cddr (upto (sqrt nump))) as x given if (eq (mod nump x) 0))) 0)
            T Nil))

(defun primes (n)
    (lcomp x for (cddr (upto n)) as x given if (is-prime x)))

(defun main ()
  (format t "Enter n: ")
  (finish-output)
  (setf *x* (read))
  (print (primes *x*)) (format t "~%") (finish-output))

