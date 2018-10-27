(in-package #:sg-utils.stream)

(defun search-forward (stream string &key collect)
  "Iterates in the stream until we find string."
  (iter (for i :from 0 :below (length string))
    (for current-char :next (read-char stream))
    (when collect (collect current-char))
    (unless (equal current-char (elt string i))
      (setq i -1))))

(defun collect-between (stream string-a string-b)
  "Collects every characters between string-a and string-b."
  (search-forward stream string-a)
  (coerce (let ((chars (search-forward stream string-b :collect t)))
            (subseq chars 0 (- (length chars) (length string-b))))
          'string))

(defmacro skip-stream-decoding-errors (&body body)
  "Skips characters that we are unable to decode when reading a stream."
  `(handler-bind ((sb-int:stream-decoding-error (lambda (x)
                                                  (declare (ignore x))
                                                  (invoke-restart 'sb-int:attempt-resync))))
     ,@body))
