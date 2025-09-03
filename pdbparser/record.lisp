(in-package #:lispmol.pdbparser)


(defclass @record ()
  (:documentation "Abstract base class for any record"))


(defclass @atom (@record)
  ((@atom-serial :initarg :@atom-serial
		 :accessor @atom-serial)
   (@atom-name :initarg :@atom-name
	       :accessor @atom-name)
   (@atom-altloc :initarg :@atom-altloc
		 :accessor @atom-altloc)
   (@atom-resname :initarg :@atom-resname
		  :accessor @atom-resname)
   (@atom-chainid :initarg :@atom-chainid
		  :accessor @atom-chainid)
   (@atom-resseq :initarg :@atom-resseq
		 :accessor @atom-resseq)
   (@atom-icode :initarg :@atom-icode
		:accessor @atom-icode)
   (@atom-x :initarg :@atom-x
	    :accessor @atom-x)
   (@atom-y :initarg :@atom-y
	    :accessor @atom-y)
   (@atom-z :initarg :@atom-z
	    :accessor @atom-z)
   (@atom-occupancy :initarg :@atom-occupancy
		    :accessor @atom-occupancy)
   (@atom-tempfactor :initarg :@atom-tempfactor
		     :accessor @atom-tempfactor)
   (@atom-element :initarg :@atom-element
		  :accessor @atom-element)
   (@atom-charge :initarg :@atom-charge
		 :accessor @atom-charge))
    (:documentation
     "Representation of an ATOM record in a PDB file.
Slots mirror the official PDB format (v3.3):
- @atom-serial     : Atom serial number (columns 7–11).
- @atom-name       : Atom name (columns 13–16).
- @atom-altloc     : Alternate location indicator (column 17).
- @atom-resname    : Residue name (columns 18–20).
- @atom-chainid    : Chain identifier (column 22).
- @atom-resseq     : Residue sequence number (columns 23–26).
- @atom-icode      : Insertion code (column 27).
- @atom-x/y/z      : Cartesian coordinates in Å (columns 31–54).
- @atom-occupancy  : Occupancy (columns 55–60).
- @atom-tempfactor : Temperature factor / B-factor (columns 61–66).
- @atom-element    : Element symbol, right-justified (columns 77–78).
- @atom-charge     : Atom charge, e.g. \"2+\" or \"1-\" (columns 79–80).

This class is intended for parsing and representing raw PDB input.
Higher-level chemistry concepts (residues, molecules, topology)
should be built in the lispmol.topology package."))
