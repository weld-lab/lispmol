(in-package #:lispmol.topology)



(defclass atom ()
  ((atom-id :initarg :atom-id
	    :type integer
	    :accessor atom-id)
   (atom-name :initarg :atom-name
	      :type string
	      :accessor atom-name)
   (atom-element :initarg :atom-element
		 :type string
		 :accessor atom-element)
   (atom-x :initarg :atom-x
	   :type double-float
	   :accessor atom-x)
   (atom-y :initarg :atom-y
	   :type double-float
	   :accessor atom-y)
   (atom-z :initarg :atom-z
	   :type double-float
	   :accessor atom-z)
   (atom-residue-id :initarg :atom-residue-id
		    :type integer
		    :accessor atom-residue-id))
  (:documentation
   "Representation of an atom in the topology.
- atom-id        : unique integer identifier
- atom-name      : PDB-style atom name (e.g. \"CA\", \"N\")
- atom-element   : chemical element symbol (e.g. \"C\", \"N\")
- atom-x/y/z     : Cartesian coordinates in Å
- atom-residue-id: identifier of the residue this atom belongs to."))

(defclass bond ()
  ((bond-i :initarg :bond-i
	   :type integer
	   :accessor bond-i)
   (bond-j :initarg :bond-j
	   :type integer
	   :accessor bond-j))
  (:documentation
   "Representation of a covalent bond between two atoms.
- bond-i : id of the first atom
- bond-j : id of the second atom
Note: bond stores only connectivity (atom ids), parameters belong to the force field."))


(defclass angle ()
  ((angle-i :initarg :angle-i
	    :type integer
	    :accessor angle-i)
   (angle-j :initarg :angle-j
	    :type integer
	    :accessor angle-j)
   (angle-k :initarg :angle-k
	    :type integer
	    :accessor angle-k))
  (:documentation
   "Representation of a bond angle defined by three atoms.
- angle-i : id of the first atom
- angle-j : id of the central atom
- angle-k : id of the third atom
Note: angle stores only topology, parameters are defined in the force field."))


(defclass dihedral ()
  ((dihedral-i :initarg :dihedral-i
	       :type integer
	       :accessor dihedral-i)
   (dihedral-j :initarg :dihedral-j
	       :type integer
	       :accessor dihedral-j)
   (dihedral-k :initarg :dihedral-k
	       :type integer
	       :accessor dihedral-k)
   (dihedral-l :initarg :dihedral-l
	       :type integer
	       :accessor dihedral-l))
  (:documentation
   "Representation of a torsional dihedral angle defined by four atoms.
- dihedral-i : id of the first atom
- dihedral-j : id of the second atom
- dihedral-k : id of the third atom
- dihedral-l : id of the fourth atom
Note: dihedral connectivity only; torsional parameters are force-field dependent."))

(defclass residue ()
  ((residue-id :initarg :residue-id
	       :type integer
	       :accessor residue-id)
   (residue-name :initarg :residue-name
		 :type string
		 :accessor residue-name)
   (residue-atoms :initarg :residue-atoms
		  :type list
		  :initform (list)
		  :accessor residue-atoms)
   (residue-bonds :initarg :residue-bonds
		  :type list
		  :initform (list)
		  :accessor residue-bonds)
   (residue-angles :initarg :residue-angles
		  :type list
		  :initform (list)
		  :accessor residue-angles)
   (residue-dihedrals :initarg :residue-dihedrals
		     :type list
		     :initform (list)
		     :accessor residue-dihedrals))
  (:documentation
   "Representation of a residue (amino acid, nucleotide, etc.) in the topology.
- residue-id       : unique integer identifier
- residue-name     : residue name (e.g. \"GLY\", \"ALA\")
- residue-atoms    : list of atom instances in this residue
- residue-bonds    : list of bond instances within this residue
- residue-angles   : list of angle instances within this residue
- residue-dihedrals: list of dihedral instances within this residue"))

(defclass molecule ()
  ((molecule-name :initarg :molecule-name
		  :type string
		  :accessor molecule-name)
   (molecule-residues :initarg :molecule-residues
		      :type list
		      :initform (list)
		      :accessor molecule-residues))
  (:documentation
   "Representation of a molecule as a collection of residues.
- molecule-name     : descriptive name for the molecule
- molecule-residues : list of residue instances composing the molecule
Note: connectivity is stored at the residue level (atoms, bonds, angles, dihedrals)."))

