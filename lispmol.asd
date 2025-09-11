(asdf:defsystem "lispmol"
  :description "A toy molecular modeling pipeline written in Common Lisp"
  :author "Erwan Le Doeuff (weld)"
  :license "MIT License"
  :serial t
  :depends-on ("cl-servante")
  :in-order-to ((test-op (test-op "lispmol/tests")))
  :components ((:file "package")
	       (:module "topology"
		:components ((:file "package")
			     (:file "topology")))
	       (:module "pdbparser"
		:components ((:file "package")
			     (:file "record")
			     (:file "parse")
			     (:file "load")))))


(asdf:defsystem "lispmol/tests"
  :depends-on ("lispmol" "fiveam")
  :components ((:file "tests/package")
	       (:file "tests/pdbparser"))
  :perform (test-op (o c)
             (uiop:symbol-call :fiveam :run! :lispmol-tests)))
