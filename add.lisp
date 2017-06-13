;;; package definition
(in-package :cl-user)
(defpackage my.add
  (:nicknames #:add)
  (:use :common-lisp)
  ;; We want to export the following functions
  (:export #:add-one 
           #:sub-one
           #:add))
(in-package #:my.add)

(defun add-one (a)
  "Add one to a"
  (1+ a))

(defun sub-one (a)
  "Subtract one from a"
  (1- a))

(defun add (a b)
  "Add two numbers recursively"
  (cond ((= b 0) a)
        (t (add (add-one a) (sub-one b)))))
