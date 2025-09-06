(defpackage #:lispmol.pdbparser
  (:nicknames #:pdbparser)
  (:use #:cl #:cl-servante.string)
  (:export #:@atom
	   #:@atom-resname
	   #:@atom-serial
	   #:@atom-x
	   #:@atom-element
	   #:@atom-charge
	   
	   #:@pdb
	   #:load-pdb
	   #:parse-atom-line))
