(defun print-options ()
  (format t "Usage: main [options] n1 n2 ~%")
  (format t "  Options:~%")
  (format t "    -a       add n1 n2~%")
  (format t "    -m       mul n1 n2~%"))

(defun main (argv)
  ;; no options are given
  (when (null (rest argv))
    (print-options)
    (return-from main))

  (let ((opt (second argv))
        (n1 (parse-integer (first (rest (rest argv)))))
        (n2 (parse-integer (second (rest (rest argv))))))
    (when (or (null n1) (null n2))
      (print-options)
      (return-from main))

    (cond ((string= opt "-a") (format t "~A~%" (my.add:add n1 n2)))
          ((string= opt "-m") (format t "~A~%" (my.mul:mul n1 n2)))
          (t (print-options)))))

