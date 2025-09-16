(defpackage #:lispmol.topology
  (:nicknames #:topology)
  (:use #:cl)
  (:shadow #:atom)
  (:export #:atom
	   #:bond
	   #:angle
	   #:dihedral
	   #:residue
	   #:residue-atoms
	   #:molecule
	   #:molecule-residues))
