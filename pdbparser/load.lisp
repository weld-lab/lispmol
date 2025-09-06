(in-package #:lispmol.pdbparser)


(defgeneric load-pdb (source)
  (:documentation "Parse .pdb ATOM records from SOURCE and return a @pdb."))


(defmethod load-pdb ((source stream))
  (let ((pdb (make-instance '@pdb)))
    (loop for line = (read-line source nil nil)
          while line
          do (when (starts-with-p line "ATOM")
               (push (parse-atom-line line) (@pdb-atoms pdb))))
    (setf (@pdb-atoms pdb) (nreverse (@pdb-atoms pdb)))
    pdb))

(defmethod load-pdb ((source pathname))
  (with-open-file (in source :direction :input)
    (load-pdb in)))

(defmethod load-pdb ((source string))
  (load-pdb (pathname source)))
