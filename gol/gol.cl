; Author: Adam Frick

(defvar *wid* NIL)
(defvar *hgt* NIL)
(defvar *table* NIL)
(defvar *new-table* NIL)

(defun main ()
  (format t "Welcome to Conway's Game of Life.~%")
  (prompt-table)
  (make-tables)
  (prompt))

(defun prompt ()
  (let ((ch "q"))
  (format t "(i)terate, (s)et/(c)lear element, (p)rint table, (q)uit: ")
  (finish-output)
  (setf ch (read))

  (cond  ((string-equal ch "i") (iterate-prompt))
         ((string-equal ch "s") (set-elem-prompt t))
         ((string-equal ch "c") (set-elem-prompt NIL))
         ((string-equal ch "p") (print-table-prompt))
         ((string-equal ch "q") (exit))
         (t (exit))
  )))

(defun iterate-prompt ()
  (let ((n 0))
  (format t "How many iterations? ")
  (finish-output)
  (setf n (read))
  (iterate n)
  (prompt)
  ))

(defun set-elem-prompt (w)
  (let ((n 0) (m 0))
  (format t "This uses 0-based indexing.~%Column? ")
  (finish-output)
  (setf n (read))
  (format t "Row? ")
  (finish-output)
  (setf m (read))
  (if (eq w t) (set-elem m n) (clear-elem m n))
  (print-table)
  (prompt)
  ))

(defun print-table-prompt ()
  (print-table) (prompt))

(defun iterate(n)
  (loop for a from 0 to (- n 1)
    do
      (update-nbrhood)
      (print-table)))

(defun prompt-table () 
  (format t "Column count? ")
  (finish-output)
  (setf *wid* (read))
  (format t "Row count? ")
  (finish-output)
  (setf *hgt* (read)))

(defun make-tables ()
  (setf *table* (make-array (list *hgt* *wid*)))
  (setf *new-table* (make-array (list *hgt* *wid*))))

(defun copy-table ()
  (loop for a from 0 to (- *hgt* 1)
    do (loop for b from 0 to (- *wid* 1)
      do
        (setf (aref *table* a b) (eq (aref *new-table* a b) t)))))

(defun print-table ()
  (loop for a from 0 to (- *hgt* 1)
    do (loop for b from 0 to (- *wid* 1)
      do
        (format t "~D " (peek-elem a b))
      )
      (format t "~%")
      )
  (format t "~%"))

(defun peek-elem (n m)
  (if (eq t (aref *table* n m)) 1 0)
  )

(defun set-elem (n m)
  (setf (aref *table* n m) t))

(defun clear-elem (n m)
  (setf (aref *table* n m) NIL))

(defun update-nbrhood ()
  (let ((count 0) (match NIL))
  (loop for a from 0 to (- *hgt* 1)
    do (loop for b from 0 to (- *wid* 1)
      do 
        (setf match NIL)
        (setf count (count-nbrs a b))

        ; die
        (cond ((and (< count 2) (eq match NIL))
               (setf (aref *new-table* a b) NIL) 
               (setf match t)))

        ; rem
        (cond ((and (eq count 2) (eq match NIL))
               (setf (aref *new-table* a b) (eq (aref *table* a b)t))
                     (setf match t)))

        ; new
        (cond ((and (eq count 3) 
                    (eq (peek-elem a b) 0) (eq match NIL)) 
               (setf (aref *new-table* a b) t)
               (setf match t)))
        
        ; rem
        (cond ((and (eq count 3) 
                    (eq (peek-elem a b) 1) (eq match NIL)) 
               (setf (aref *new-table* a b) (eq (aref *table* a b) t))
               (setf match t)))

        ;die
        (cond ((and (> count 3) (eq match NIL))
                    (setf (aref *new-table* a b) NIL)
                           (setf match t)))
        ))
  (copy-table)
  ))

(defun count-nbrs (n m)
  (let ((count 0))

  (if (> n 0)
    (incf count (peek-elem (- n 1) m)))
  (if (> m 0)
    (incf count (peek-elem n (- m 1))))
  (if (< (+ n 1) *hgt*)
    (incf count (peek-elem (+ n 1) m)))
  (if (< (+ m 1) *wid*)
    (incf count (peek-elem n (+ m 1))))

  (if (and (> n 0) (> m 0))
    (incf count (peek-elem (- n 1) (- m 1))))
  (if (and (< (+ n 1) *hgt*) (< (+ m 1) *wid*))
    (incf count (peek-elem (+ n 1) (+ m 1))))
  (if (and (< (+ n 1) *hgt*) (> m 0))
    (incf count (peek-elem (+ n 1) (- m 1))))
  (if (and (> n 0) (< (+ m 1) *wid*))
    (incf count (peek-elem (- n 1) (+ m 1))))

  count))

