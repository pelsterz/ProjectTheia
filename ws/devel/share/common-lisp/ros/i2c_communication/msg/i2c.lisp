; Auto-generated. Do not edit!


(cl:in-package i2c_communication-msg)


;//! \htmlinclude i2c.msg.html

(cl:defclass <i2c> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (value
    :reader value
    :initarg :value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass i2c (<i2c>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <i2c>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'i2c)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name i2c_communication-msg:<i2c> is deprecated: use i2c_communication-msg:i2c instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:header-val is deprecated.  Use i2c_communication-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:value-val is deprecated.  Use i2c_communication-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <i2c>) ostream)
  "Serializes a message object of type '<i2c>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'value)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <i2c>) istream)
  "Deserializes a message object of type '<i2c>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'value)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<i2c>)))
  "Returns string type for a message object of type '<i2c>"
  "i2c_communication/i2c")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'i2c)))
  "Returns string type for a message object of type 'i2c"
  "i2c_communication/i2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<i2c>)))
  "Returns md5sum for a message object of type '<i2c>"
  "5760aa9c40c2caa52a04d293094e679d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'i2c)))
  "Returns md5sum for a message object of type 'i2c"
  "5760aa9c40c2caa52a04d293094e679d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<i2c>)))
  "Returns full string definition for message of type '<i2c>"
  (cl:format cl:nil "Header header~%uint16 value~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'i2c)))
  "Returns full string definition for message of type 'i2c"
  (cl:format cl:nil "Header header~%uint16 value~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <i2c>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <i2c>))
  "Converts a ROS message object to a list"
  (cl:list 'i2c
    (cl:cons ':header (header msg))
    (cl:cons ':value (value msg))
))
