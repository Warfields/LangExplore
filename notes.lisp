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

#||

This is Samuel Warfield's Exploration into the comman Lisp language

Lisp is the Second oldest high level Programing language (Fortran is older by 1 year)
60 Years old as of Feb 2018

The nearest thing Common Lisp has to a motto is the koan-like description, "the programmable programming language."

Lisp is Dynamically Typed!

Object oriented through he Common Lisp Object System (CLOS) written in lisp

If written with proper  LISP can run just as fast as C code!
declarations
So, on one hand, Lisp is one of computer science's "classical" languages, based on ideas that have stood the test of time.8 On the other, it's a thoroughly modern, general-purpose language whose design reflects a deeply pragmatic approach to solving real problems as efficiently and robustly as possible

Ideas first introduced in Lisp include the if/then/else construct, recursive function calls, dynamic memory allocation, garbage collection, first-class functions, lexical closures, interactive programming, incremental compilation, and dynamic typing.

The Roomba is written in LISP

Common Lisp is a standard not a language, so there are several implimentations of the standard, even you can write your own implimentation of Common Lisp;

A plist is a list where every other element, starting with the first, is a symbol that describes what the next element in the list is


||#