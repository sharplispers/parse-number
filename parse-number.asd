;; -*- Lisp -*-

(defsystem :parse-number
  :author "Matthew Danish"
  :maintainer "Sharp Lispers <sharplispers@googlegroups.com>"
  :version "1.1"
  :components ((:file "parse-number"))
  :in-order-to ((asdf:test-op (asdf:load-op :parse-number-tests)))
  :perform (asdf:test-op :after (op c)
             (funcall (find-symbol (string '#:run-tests)
                                   :org.mapcar.parse-number-tests))))

(defsystem :parse-number-tests
  :depends-on (:parse-number)
  :components ((:file "tests")))
