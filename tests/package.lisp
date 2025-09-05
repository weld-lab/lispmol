(defpackage #:lispmol/tests
  (:use #:cl #:fiveam))

(in-package #:lispmol/tests)

(fiveam:def-suite :lispmol-tests)
(fiveam:def-suite :lispmol-tests.pdbparser :in :lispmol-tests)

