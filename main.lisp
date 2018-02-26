(defparameter *template-dir* 
    (concatenate 'list (pathname-directory 
        (merge-pathnames (user-homedir-pathname))) (list "mkfile")))
(defparameter *current-dir* '(:relative ""))

(defun invalid-options-specified ()
    (format t "Invalid valid options specified.~%"))

(defun no-options-specified ()
    (format t "No valid options specified.~%"))
    
(defun validate-and-continue (opts desired-length cb)
    (if (equal (list-length opts) desired-length)
        (apply cb (list ))
        (invalid-options-specified)))

(defun create-new-template (opts)
    (validate-and-continue opts 3 (lambda ()
        (ensure-directories-exist (make-pathname :directory *template-dir*))
        (with-open-file (fstream (make-pathname 
                                    :directory *template-dir*
                                    :name (nth 1 opts) 
                                    :type "txt") 
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
            (format fstream (nth 2 opts))))))

(defun create-new-file (opts)
    (validate-and-continue opts 3 (lambda ()
        (with-open-file (template-stream (make-pathname 
                                        :directory *template-dir* 
                                        :name (nth 1 opts) 
                                        :type "txt")
                        :direction :input)
            (with-open-file (next-stream (make-pathname 
                                            :directory *current-dir*
                                            :name (nth 2 opts))
                            :direction :output
                            :if-exists :supersede
                            :if-does-not-exist :create)
                            (let ((buffer (make-array 4096 :element-type (stream-element-type template-stream))))
                                (loop for pos = (read-sequence buffer template-stream)
                                    while (plusp pos)
                                        do (write-sequence buffer next-stream :end pos))))))))

(defun -main- (opts)
    (let ((option (nth 0 opts)))
        (cond 
            ((equal option "init") (create-new-template opts))
            ((equal option "create") (create-new-file opts))
            (t (no-options-specified)))))

;; testing
;; ((lambda ()
;;     (pop *posix-argv*)
;;     (-main- *posix-argv*)))
