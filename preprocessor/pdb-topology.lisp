(in-package #:lispmol.preprocessor)

(defmethod make-molecule-from-record ((@p pdbparser:@pdb))
  (let ((table (group-by-residue @p))
	(mol (make-instance 'topology:molecule :molecule-name "empty")))
    (maphash
     #'(lambda (key bucket)
	 (push (make-instance 'topology:residue
			      :residue-id (third key)
			      :residue-name (first key)
			      :residue-atoms (mapcar #'make-atom-from-record bucket))
	       (topology:molecule-residues mol)))
     table)
    mol))


(defmethod make-atom-from-record ((@a pdbparser:@atom))
  (make-instance 'topology:atom
		 :atom-id (pdbparser:@atom-serial @a)
		 :atom-name (pdbparser:@atom-name @a)
		 :atom-element (pdbparser:@atom-element @a)
		 :atom-x (pdbparser:@atom-x @a)
		 :atom-y (pdbparser:@atom-y @a)
		 :atom-z (pdbparser:@atom-z @a)
		 :atom-residue-id (pdbparser:@atom-resseq @a)))
