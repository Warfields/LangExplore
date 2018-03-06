
SRC_NAME = collatz

$(SRC_NAME): $(SRC_NAME).cl
	sbcl --load '$(SRC_NAME).cl' --eval "(sb-ext:save-lisp-and-die \"$(SRC_NAME)\" :executable t :toplevel 'main)"
