(in-package #:lispmol.pdbparser)


(defgeneric load-pdb (source)
  (:documentation "Parse PDB ATOM/HETATM records from SOURCE and return a list of @atom."))


(defmethod load-pdb ((source stream))
  "not yet implemented"
  nil)

(defmethod load-pdb ((source pathname))
  (with-open-file (in source :direction :input)
    (load-pdb in)))

(defmethod load-pdb ((source string))
  (load-pdb (pathname source)))
