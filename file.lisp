(in-package #:sg-utils.file)

(defun directory-files-recursive (directory)
  "Recursive uiop:directory-files."
  (nconc (uiop:directory-files directory)
         (iter (for subdirectory in (uiop:subdirectories directory))
               (nconcing (directory-files-recursive subdirectory)))))

(defun files-equal-p (file-a file-b)
  "Tests if two files are equal."
  (with-open-file (stream-a file-a)
    (with-open-file (stream-b file-b)
      (iter
       (for char-a :in-stream stream-a)
       (for char-b :in-stream stream-b)
       (always (equal char-a char-b))
       (finally (and (null char-a)
                     (null (read-char stream-b))))))))
