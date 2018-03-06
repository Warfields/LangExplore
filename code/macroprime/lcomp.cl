; I modified a python list comprehension to more
; closely resemble an expresive haskell list comprehension
; https://stackoverflow.com/questions/267862/what-makes-lisp-macros-so-special
(defmacro lcomp (expression for list as var given conditional conditional-test)
  ;; create a unique variable name for the result
  (let ((result (gensym)))
    ;; the arguments are really code so we can substitute them
    ;; store nil in the unique variable name generated above
    `(let ((,result nil))
       ;; var is a variable name
       ;; list is the list literal we are suppose to iterate over
       (loop for ,var in ,list
            ;; conditional is if or unless
            ;; conditional-test is (= (mod x 2) 0) in our examples
            ,conditional ,conditional-test
            ;; and this is the action from the earlier lisp example
            ;; result = result + [x] in python
            do (setq ,result (append ,result (list ,expression))))
           ;; return the result
       ,result)))


;This is me writing a macro for generating a list up to or between two numbers
(defmacro upto (last)
    (let ((result (gensym)))
      `(let ((,result nil))
        (loop for i from 0 to ,last
          do (setq ,result (append ,result (list i))))

        ,result)))
