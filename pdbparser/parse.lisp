(in-package #:lispmol.pdbparser)



(defmethod parse-atom-line ((line string))
  (flet
      ((safe-char (c)
         (if (or (null c) (char= c #\Space)) #\Space c))
       
       (safe-float (s)
         (let ((trim (string-trim " " s)))
           (if (zerop (length trim)) 0d0
               (coerce (read-from-string trim) 'double-float)))))
    
    (assert (starts-with-p line "ATOM") ()
	    "Expected ATOM line, got ~a" line)
    (make-instance '@atom
		   :@atom-serial (parse-integer (string-trim " " (slice 6 11 line)) :junk-allowed t)
		   :@atom-name (string-trim " " (slice 12 16 line))
		   :@atom-altloc (safe-char (char line 16))
		   :@atom-resname (string-trim " " (slice 17 20 line))
		   :@atom-chainid (safe-char (char line 21))
		   :@atom-resseq (parse-integer (string-trim " " (slice 22 26 line)) :junk-allowed t)
		   :@atom-icode (safe-char (char line 26))
		   :@atom-x (safe-float (slice 30 38 line))
		   :@atom-y (safe-float (slice 38 46 line))
		   :@atom-z (safe-float (slice 46 54 line))
		   :@atom-occupancy (safe-float (slice 54 60 line))
		   :@atom-tempfactor (safe-float (slice 60 66 line))
		   :@atom-element (string-trim " " (slice 76 78 line))
		   :@atom-charge (string-trim " " (slice 78 80 line)))))
