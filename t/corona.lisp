(in-package :cl-user)
(defpackage corona-test
  (:use :cl :fiveam))
(in-package :corona-test)

;;; Variables

(defparameter +tmp-directory+
  (asdf:system-relative-pathname :corona #p"tmp/"))

;;; Test suites

(def-suite corona)
(in-suite corona)

(test testing-environment
  (is-true
   #+corona-testing t #-corona-testing nil)
  (is (equal corona.files:+corona-directory+
             (asdf:system-relative-pathname :corona #p"t/corona-files/"))))

(run! 'corona)

(remove :corona-testing *features*)
