(in-package #:lispmol.preprocessor)


(defmethod group-by-residue ((@p pdbparser:@pdb))
  "Returns a hash-table (resname chainid resseq icode):(list @atoms) ; beware of the order in each bucket (LIFO)"
  (let ((table (make-hash-table :test 'equal)))
    (loop for @a in (pdbparser:@pdb-atoms @p)
	  for key = (list (pdbparser:@atom-resname @a)
			  (pdbparser:@atom-chainid @a)
			  (pdbparser:@atom-resseq @a)
			  (pdbparser:@atom-icode @a))
	  do (push @a (gethash key table))
	  finally (return table))))
