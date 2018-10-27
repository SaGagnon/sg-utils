;;;; sg-utils.asd

(asdf:defsystem #:sg-utils
  :description "Describe sg-utils here"
  :author "Samuel Gagnon <samuel.gagnon92@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:quickproject
               #:uiop
               #:iterate)
  :components ((:file "package")
               (:file "project")
               (:file "file")
               (:file "stream")))
