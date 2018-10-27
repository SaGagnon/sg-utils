;;;; package.lisp

(defpackage #:sg-utils.project
  (:use #:cl)
  (:export #:make-project))

(defpackage #:sg-utils.file
  (:use #:cl #:iterate #:uiop)
  (:export
   :directory-files-recursive
   :files-equal-p))

(defpackage #:sg-utils.stream
  (:use #:cl #:iterate)
  (:export
   :search-foward
   :collect-between
   :skip-stream-decoding-errors))
