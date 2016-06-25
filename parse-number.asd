;; -*- Lisp; indent-tabs-mode: nil -*-

(defsystem :parse-number
  :author "Matthew Danish <mrd@debian.org>"
  :maintainer "Sharp Lispers <sharplispers@googlegroups.com>"
  :description "Number parsing library"
  :license "BSD 3-Clause"
  :version (:read-file-form "version.sexp")
  :components ((:static-file "version.sexp")
               (:file "parse-number"))
  :in-order-to ((asdf:test-op (asdf:load-op :parse-number-tests)))
  :perform (asdf:test-op :after (op c)
             (funcall (find-symbol (string '#:run-tests)
                                   :org.mapcar.parse-number-tests))))

(defsystem :parse-number-tests
  :author "Stelian Ionescu <sionescu@cddr.org>"
  :maintainer "Sharp Lispers <sharplispers@googlegroups.com>"
  :description "Parse-Number test suite"
  :license "BSD 3-Clause"
  :depends-on (:parse-number)
  :components ((:file "tests")))
