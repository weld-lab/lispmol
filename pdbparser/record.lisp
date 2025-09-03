(in-package #:lispmol.pdbparser)




(defclass @record ()
  ()
  (:documentation "Abstract base class for any record"))


(defclass @pdb (@record)
  ((@pdb-atoms :initarg :@pdb-atoms
	       :accessor @pdb-atoms
	       :initform (list)
	       :type list
	       :documentation "List of @atom records")))

(defclass @atom (@record)
  ((@atom-serial :initarg :@atom-serial
		 :accessor @atom-serial
		 :type integer)
   (@atom-name :initarg :@atom-name
	       :accessor @atom-name
	       :type string)
   (@atom-altloc :initarg :@atom-altloc
		 :accessor @atom-altloc
		 :type character)
   (@atom-resname :initarg :@atom-resname
		  :accessor @atom-resname
		  :type string)
   (@atom-chainid :initarg :@atom-chainid
		  :accessor @atom-chainid
		  :type character)
   (@atom-resseq :initarg :@atom-resseq
		 :accessor @atom-resseq
		 :type (or null integer))
   (@atom-icode :initarg :@atom-icode
		:accessor @atom-icode
		:type character)
   (@atom-x :initarg :@atom-x
	    :accessor @atom-x
	    :type double-float)
   (@atom-y :initarg :@atom-y
	    :accessor @atom-y
	    :type double-float)
   (@atom-z :initarg :@atom-z
	    :accessor @atom-z
	    :type double-float)
   (@atom-occupancy :initarg :@atom-occupancy
		    :accessor @atom-occupancy
		    :type (or null double-float))
   (@atom-tempfactor :initarg :@atom-tempfactor
		     :accessor @atom-tempfactor
		     :type (or null double-float))
   (@atom-element :initarg :@atom-element
		  :accessor @atom-element
		  :type string)
   (@atom-charge :initarg :@atom-charge
		 :accessor @atom-charge
		 :type (or null integer)))
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
