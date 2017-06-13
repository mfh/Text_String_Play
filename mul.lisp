;;; package definition
(in-package :cl-user)
(defpackage my.mul
  (:nicknames #:mul)
  (:use :common-lisp)
  ;; We need add from add.lisp
  (:import-from #:my.add
                #:add)
  (:export #:mul))
(in-package #:my.mul)

(defun mul (a b)
  (let ((result 0))
    (dotimes (i b)
      (setf result (add result a)))
    result))
