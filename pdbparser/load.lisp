(in-package #:lispmol.pdbparser)


(defgeneric load-pdb (source)
  (:documentation "Parse .pdb ATOM records from SOURCE and return a list of @atom."))


(defmethod load-pdb ((source stream))
  (declare (ignore source))
  (error "Not yet implemented."))

(defmethod load-pdb ((source pathname))
  (with-open-file (in source :direction :input)
    (load-pdb in)))

(defmethod load-pdb ((source string))
  (load-pdb (pathname source)))
