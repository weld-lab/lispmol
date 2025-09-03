(asdf:defsystem "lispmol"
  :description "A toy molecular modeling pipeline written in Common Lisp"
  :author "Erwan Le Doeuff (weld)"
  :license "MIT License"
  :serial t
  :depends-on ("cl-servante")
  :components ((:file "package")
	       (:module "topology"
		:components ((:file "package")))
	       (:module "pdbparser"
		:components ((:file "package")
			     (:file "record")
			     (:file "parse")
			     (:file "load")))))
