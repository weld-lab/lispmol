(defpackage #:lispmol.pdbparser
  (:nicknames #:pdbparser)
  (:use #:cl #:cl-servante.string)
  (:export #:@atom
	   #:@atom-resname
	   #:@atom-serial
	   #:@atom-x
	   #:@atom-element
	   #:@atom-charge
	   #:@atom-chainid
	   #:@atom-icode
	   #:@atom-resseq
	   
	   #:@pdb
	   #:@pdb-atoms
	   #:load-pdb
	   #:parse-atom-line))
