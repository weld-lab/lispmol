(in-package #:lispmol/tests)

(fiveam:in-suite :lispmol-tests.preprocessor)


(test
    group-by-residue-valid
  
  (let* ((@p (pdbparser:load-pdb "lispmol/tests/6WSK.pdb"))
	 (table (preprocessor:group-by-residue @p))
	 (key '("GLY" #\A -165 #\ ))
	 (bucket (gethash key table)))
    (is (= (length bucket) 7)))


  (let* ((@p (pdbparser:load-pdb "lispmol/tests/2RH1.pdb"))
	 (table (preprocessor:group-by-residue @p))
	 (key '("ILE" #\A 72 #\ ))
	 (bucket (gethash key table)))
    (is (= (length bucket) 8))))
