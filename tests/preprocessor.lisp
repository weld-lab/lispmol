(in-package #:lispmol/tests)

(fiveam:in-suite :lispmol-tests.preprocessor)


(test
    group-by-residue-valid
  (let* ((@p (pdbparser:load-pdb "lispmol/tests/6WSK.pdb"))
	 (table (preprocessor:group-by-residue @p))
	 (key '("GLY" #\A -165 #\Space))
	 (bucket (gethash key table)))
    (is (not (null bucket)))
    (is (= (length bucket) 7))
    (is (every (lambda (@a)
                 (string= "GLY" (pdbparser:@atom-resname @a)))
               bucket)))
  
  (let* ((@p (pdbparser:load-pdb "lispmol/tests/2RH1.pdb"))
	 (table (preprocessor:group-by-residue @p))
	 (key '("ILE" #\A 72 #\Space))
	 (bucket (gethash key table)))
    (is (not (null bucket)))
    (is (= (length bucket) 8))
    (is (every (lambda (@a)
                 (string= "ILE" (pdbparser:@atom-resname @a)))
               bucket))))


(test
    molecule-from-record-valid
  (let* ((@p (pdbparser:load-pdb "lispmol/tests/2RH1.pdb"))
         (mol (preprocessor:make-molecule-from-record @p))
         (natoms-in-pdb (length (pdbparser:@pdb-atoms @p)))
         (natoms-in-mol (length
			 (loop for r in (topology:molecule-residues mol)
                               append (topology:residue-atoms r)))))
    (is (= natoms-in-mol natoms-in-pdb))))
