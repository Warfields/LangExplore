;;;; This is a lisp implimentation of the Sieve of Eratosthenes for finding prime numbers.
;;;  By Samuel Warfield (Very Happy Dog Lovers)

(defun prompt-read (prompt) ; This was helped by http://www.gigamonkeys.com/book/practical-a-simple-database.html
    (format *query-io* "~a: " prompt)
    (force-output *query-io*)
    (read-line *query-io*)
)

(defun makeSquence (max) ; This creates a list from 2 to a number!
    (loop for n from 2 to max collect n))

(defvar *maxPrime* 2)
(format t "This program will find all of the prime numbers between 2 and an upper bound!~%") (finish-output)

;;; Prompt user for where to find Primes
(let ((userInput ""))
    (setf userInput (prompt-read "What number do you want to stop finding primes at? "))
    (setf *maxPrime* (parse-integer userInput :junk-allowed t))
)

;;; If the number is valid run then sieve

(cond ((and (> *maxPrime* 2) (not (equal *maxPrime* NIL))) ; Check if the user number is viable
    (print "The number you entered is valid beginning")
    (defvar *primeList* (makeSquence *maxPrime*)) ; Allocates list space
    (loop for x in *primeList*
        do (loop for y from 2 while (<= (* x y) *maxPrime*)
            do (setf *primeList* (REMOVE-IF-NOT #'(lambda (q) (not (equal q (* x y)))) *primeList*))))
    (print *primeList*)))