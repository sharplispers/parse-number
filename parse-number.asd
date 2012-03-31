;; -*- Lisp -*-

(defsystem :parse-number
  :author "Matthew Danish"
  :maintainer "Sharp Lispers <sharplispers@googlegroups.com>"
  :version #.(with-open-file (f (merge-pathnames "version.lisp-expr"
                                                 (or *compile-file-pathname*
                                                     *load-truename*)))
               (read f))
  :components ((:file "parse-number"))
  :in-order-to ((asdf:test-op (asdf:load-op :parse-number-tests)))
  :perform (asdf:test-op :after (op c)
             (funcall (find-symbol (string '#:run-tests)
                                   :org.mapcar.parse-number-tests))))

(defsystem :parse-number-tests
  :depends-on (:parse-number)
  :components ((:file "tests")))
