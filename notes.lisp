;;;; This is where describe you program
;;; Generic Coment
;; indented with code
; comment after a line of code
#||
Multiline comment
||#

(Format t "Hello World ~%") ; t is to print to termail, "~%" is the newline char
(Print "What's up Doc") ; works too

;;; lisp is not case sensative

(defvar *name* (read)) ; Global vars are *surrounded*, read is stdin
(defun hello-you (*name*)
    (format t "Hello ~a! ~%" *name*)
) ; defining a variable

(loop for x from 1 to 10 
    do(print "hi"))

(list :a 1 :b 2 :c 3) ; A plist (property list)

(getf (list :a 1 :b 2 :c 3) :a) ; returns 1
