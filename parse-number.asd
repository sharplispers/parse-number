;; -*- Lisp -*-

(defpackage #:parse-number-system
  (:use #:common-lisp #:asdf))

(in-package #:parse-number-system)

(defsystem parse-number
  :author "Matthew Danish"
  :version "1.0"
  :components ((:file "parse-number")))
