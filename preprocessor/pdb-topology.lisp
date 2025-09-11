(in-package #:lispmol.preprocessor)


(defmethod make-molecule-from-record ((p pdbparser:@pdb))
  (declare (ignore p))
  (error "Not implemented yet"))


(defmethod make-atom-from-record ((a pdbparser:@atom))
  (declare (ignore a))
  (error "Not implemented yet"))
