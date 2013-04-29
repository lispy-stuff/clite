(asdf:defsystem clite
  :name "clite"
  :description "Lite weight testing framework"
  :version "1.0.0"
  :author "Andreas Wild <lispy.stuff@gmail.com>"
  :licence "ISC"
  :components ((:file "core")
               (:file "clite" :depends-on ("core"))))