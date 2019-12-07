;; Auto-generated. Do not edit!


(when (boundp 'i2c_communication::i2c)
  (if (not (find-package "I2C_COMMUNICATION"))
    (make-package "I2C_COMMUNICATION"))
  (shadow 'i2c (find-package "I2C_COMMUNICATION")))
(unless (find-package "I2C_COMMUNICATION::I2C")
  (make-package "I2C_COMMUNICATION::I2C"))

(in-package "ROS")
;;//! \htmlinclude i2c.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass i2c_communication::i2c
  :super ros::object
  :slots (_header _value ))

(defmethod i2c_communication::i2c
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _value (round __value))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _value
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _value
       (write-word _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _value
     (setq _value (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get i2c_communication::i2c :md5sum-) "5760aa9c40c2caa52a04d293094e679d")
(setf (get i2c_communication::i2c :datatype-) "i2c_communication/i2c")
(setf (get i2c_communication::i2c :definition-)
      "Header header
uint16 value

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



(provide :i2c_communication/i2c "5760aa9c40c2caa52a04d293094e679d")


