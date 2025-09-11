(defpackage #:lispmol.topology
  (:nicknames #:topology)
  (:use #:cl)
  (:shadow #:atom)
  (:export #:atom
	   #:bond
	   #:angle
	   #:dihedral
	   #:residue
	   #:molecule))
