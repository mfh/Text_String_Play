# You can ignore the following two lines if buildapp and sbcl can
# be found in PATH and SBCL_HOME is set
PATH := ${PATH}:/usr/local/bin
SBCL_HOME := /usr/lib/sbcl

TARGETS = main

# We need to include the external libraries we used
ASDF_TREE = --asdf-tree ~/quicklisp/dists/quicklisp/software/
SYSTEM = --load-system fiveam

all: $(TARGETS)

main: main.lisp add.lisp mul.lisp
	buildapp --output main \
	--load add.lisp \
	--load mul.lisp \
	--load main.lisp \
	--entry main

test: add.lisp mul.lisp add-test.lisp mul-test.lisp
	buildapp --output test \
	$(ASDF_TREE) \
	$(SYSTEM) \
	--load add.lisp \
	--load mul.lisp \
	--load add-test.lisp \
	--load mul-test.lisp \
	--load main.lisp \
	--eval '(defun main (argv) (declare (ignore argv)) (my.add.test:run-test) (my.mul.test:run-test))' \
	--entry main

clean:
	rm -rf ./test ./main
