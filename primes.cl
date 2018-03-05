;;;; This is a lisp implimentation of the Sieve of Eratosthenes for finding prime numbers.
;;;  By Samuel Warfield (Very Happy Dog Lovers)


(defun prompt-read (prompt) ; This was helped by http://www.gigamonkeys.com/book/practical-a-simple-database.html
    (format *query-io* "~a: " prompt)
    (force-output *query-io*)
    (read-line *query-io*)
)

(defun makeSquence (max) 
    (loop for n from 2 to max
    do(append n)))

(defvar *maxPrime* 2)

;;; Prompt user for where to find Primes
(let ((userInput ""))
    (setf userInput (prompt-read "What number do you want to stop finding primes at? "))
    (setf *maxPrime* (parse-integer userInput :junk-allowed t))
)

;;; If the number is valid run then sieve

;(defvar *primeList* (list 0 1 3 4 2)) ; create a list of integers to store the final primes

(cond ((and (> *maxPrime* 2) (not (equal *maxPrime* NIL)))
    (print "Number is valid beginning")
    (print (makeSquence 5))))

(print *maxPrime*)