(in-package #:lispmol/tests)

(fiveam:in-suite :lispmol-tests.pdbparser)


;; load-pdb
(test load-pdb-file-does-not-exist
  (let ((pdb "~/not-existing.pdb"))
    (signals file-error (pdbparser:load-pdb pdb))))


;; parse-atom-line
(test parse-valid-atom-line
  (let* ((atom-line "ATOM      4  O   GLY A-165      41.939  43.898  33.060  1.00 28.93           O")
	 (a (pdbparser:parse-atom-line atom-line)))
    (is (= (pdbparser:@atom-serial a) 4))
    (is (string= (pdbparser:@atom-resname a) "GLY"))
    (is (= (pdbparser:@atom-x a) 41.939))
    (is (string= (pdbparser:@atom-element a) "O"))
    (is (string= (pdbparser:@atom-charge a) ""))))

(test parse-invalid-atom-line
  (let ((line "HETATM      4  O   GLY A-165      41.939  43.898  33.060  1.00 28.93           O"))
    (signals error
      (pdbparser:parse-atom-line line))))
