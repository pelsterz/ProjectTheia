;; Auto-generated. Do not edit!


(when (boundp 'interpreter::i2c)
  (if (not (find-package "INTERPRETER"))
    (make-package "INTERPRETER"))
  (shadow 'i2c (find-package "INTERPRETER")))
(unless (find-package "INTERPRETER::I2C")
  (make-package "INTERPRETER::I2C"))

(in-package "ROS")
;;//! \htmlinclude i2c.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass interpreter::i2c
  :super ros::object
  :slots (_header _action _address _register _bit_start _length _value ))

(defmethod interpreter::i2c
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:action __action) 0)
    ((:address __address) 0)
    ((:register __register) 0)
    ((:bit_start __bit_start) 0)
    ((:length __length) 0)
    ((:value __value) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _action (round __action))
   (setq _address (round __address))
   (setq _register (round __register))
   (setq _bit_start (round __bit_start))
   (setq _length (round __length))
   (setq _value __value)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:address
   (&optional __address)
   (if __address (setq _address __address)) _address)
  (:register
   (&optional __register)
   (if __register (setq _register __register)) _register)
  (:bit_start
   (&optional __bit_start)
   (if __bit_start (setq _bit_start __bit_start)) _bit_start)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _action
    1
    ;; uint8 _address
    1
    ;; uint8 _register
    1
    ;; uint8 _bit_start
    1
    ;; uint8 _length
    1
    ;; uint8[] _value
    (* 1    (length _value)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _action
       (write-byte _action s)
     ;; uint8 _address
       (write-byte _address s)
     ;; uint8 _register
       (write-byte _register s)
     ;; uint8 _bit_start
       (write-byte _bit_start s)
     ;; uint8 _length
       (write-byte _length s)
     ;; uint8[] _value
     (write-long (length _value) s)
     (princ _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _action
     (setq _action (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _address
     (setq _address (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _register
     (setq _register (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _bit_start
     (setq _bit_start (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _length
     (setq _length (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[] _value
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _value (make-array n :element-type :char))
     (replace _value buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get interpreter::i2c :md5sum-) "02bbf66b000fb349dca73007c00d3fea")
(setf (get interpreter::i2c :datatype-) "interpreter/i2c")
(setf (get interpreter::i2c :definition-)
      "Header header
uint8 action
uint8 address
uint8 register
uint8 bit_start
uint8 length
uint8[] value

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :interpreter/i2c "02bbf66b000fb349dca73007c00d3fea")


