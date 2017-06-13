;;; package definition
(in-package :cl-user)
(defpackage my.mul.test
  (:use :common-lisp
        :fiveam)
  (:import-from #:my.mul
                #:mul)
  (:export #:run-test))
(in-package #:my.mul.test)

;;; test suite
(def-suite mul-suite :description "Test suite for multiplication.")
(in-suite mul-suite)

;;; test cases
(defconstant +mul-test-data+ '((0 0 0)
                               (0 1 0)
                               (1 1 1)
                               (8 2 4)))
(test mul
  (mapcar #'(lambda (lst)
              (let ((truth (first lst))
                    (result (mul (first (rest lst))
                                 (second (rest lst)))))
                (is (equal result truth)
                    (format nil "Expect ~A. Got ~A" truth result))))
          +mul-test-data+))

(defun run-test ()
  (run! 'mul-suite))
