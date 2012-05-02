;;;; -*- Mode: Lisp -*-

(defpackage #:org.mapcar.parse-number-tests
  (:use #:common-lisp #:org.mapcar.parse-number)
  (:export #:run-tests))

(in-package #:org.mapcar.parse-number-tests)

(defparameter *test-values*
  '("1" "-1" "1034" "3." "-3." "-364" "80/335" "1.3214" "3.5333" "2.4E4" "6.8d3" "#xFF"
    "#b-1000" "#o-101/75" "13.09s3" "35.66l5" "21.4f2" "#C(1 2)"
    "#c ( #xF #o-1 ) " "#c(1d1 2s1)" "#16rFF" "#9r10" "#C(#9r44/61 4f4)"))

(defparameter *expected-failures* ())

(defun run-tests ()
  (format t "~&~16@A (~16@A) = ~16A ~16A~%~%"
	  "String value" "READ value" "Parsed value" "*rdff*")
  (let ((expected-failures '())
	(unexpected-failures '()))
    (dolist (value *test-values*)
      (dolist (*read-default-float-format* '(double-float single-float))
	(let ((left (read-from-string value))
	      (right (parse-number value)))
	  (format t "~&~18@S (~26@A) = ~26A ~20A~%"
		  value
		  left
		  right
		  *read-default-float-format*)
	  (unless (eql left right)
	    (if (find value *expected-failures* :test #'string=)
		(pushnew value expected-failures :test #'string=)
		(pushnew value unexpected-failures :test #'string=))))))
    (flet ((format-failures (label val)
	     (when val
	       (format t "~A: ~{~_~A~^, ~}.~%" label val))))
      (format-failures "Expected failures" expected-failures)
      (format-failures "Unexpected failures" unexpected-failures)
      (format-failures "Unexpected successes"
		       (set-difference *expected-failures* expected-failures
				       :test #'string=)))))
