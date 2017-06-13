;;; package definition
(in-package :cl-user)
(defpackage my.add.test      ; our package name
  (:use :common-lisp         ; we will use functions from common
        :fiveam)             ; lisp and fiveam
  (:import-from #:my.add     ; this is our package for addition
                #:add-one    ; add one to a number
                #:sub-one    ; subtract one from a number
                #:add)       ; add two numbers
  (:export #:run-test))
(in-package #:my.add.test)

;;; define test suite
(def-suite add-suite :description "Test suite for addition.")
(in-suite add-suite)

;;; all the test cases
(defconstant +add-one-test-data+ '((1 0)
                                   (2 1)))
(test add-one
  (mapcar #'(lambda (pair)
              (let ((result (add-one (second pair)))
                    (truth (first pair)))
                (is (equal result truth)
                    (format nil "Expect ~A. Got ~A" truth result))))
          +add-one-test-data+))

(defconstant +sub-one-test-data+ '((-2 -1)
                                   (-1 0)))
(test sub-one
  (mapcar #'(lambda (pair)
              (let ((result (sub-one (second pair)))
                    (truth (first pair)))
                (is (equal result truth)
                    (format nil "Expect ~A. Got ~A" truth result))))
          +sub-one-test-data+))

(defconstant +add-test-data+ '((0 0 0)
                               (1 1 0)
                               (2 1 1)
                               (4 2 2)))
(test (add :depends-on add-one) ; this test case depends on add-one
  (mapcar #'(lambda (lst)
              (let ((truth (first lst))
                    (result (add (first (rest lst))
                                 (second (rest lst)))))
                (is (equal result truth)
                    (format nil "Expect ~A. Got ~A" truth result))))
          +add-test-data+))

(defun run-test ()
  (run! 'add-suite))
