;;;; project.lisp

(in-package #:sg-utils.project)

(defun make-project (name)
  "Wrapper around quickproject:make-project that also initialize a git repo."
  (let ((project-path
          (make-pathname :directory `(:absolute "home" "sam" "quicklisp" "local-projects" ,name)))
        (quickproject:*author* "Samuel Gagnon <samuel.gagnon92@gmail.com>")
        (quickproject:*license* "MIT"))
    (quickproject:make-project project-path)
    ;; Git
    (uiop:chdir project-path)
    (mapc (lambda (command) (uiop:run-program command))
          '(("git" "init" )
            ("git" "add" "--all")
            ("git" "commit" "-m" "First commit.")
            ("touch" ".gitignore")))))

