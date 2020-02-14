
(cl:in-package :asdf)

(defsystem "interpreter-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "i2c" :depends-on ("_package_i2c"))
    (:file "_package_i2c" :depends-on ("_package"))
  ))