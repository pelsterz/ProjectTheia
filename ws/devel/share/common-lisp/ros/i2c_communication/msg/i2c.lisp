; Auto-generated. Do not edit!


(cl:in-package i2c_communication-msg)


;//! \htmlinclude i2c.msg.html

(cl:defclass <i2c> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (action
    :reader action
    :initarg :action
    :type cl:fixnum
    :initform 0)
   (address
    :reader address
    :initarg :address
    :type cl:fixnum
    :initform 0)
   (register
    :reader register
    :initarg :register
    :type cl:fixnum
    :initform 0)
   (bit_start
    :reader bit_start
    :initarg :bit_start
    :type cl:fixnum
    :initform 0)
   (length
    :reader length
    :initarg :length
    :type cl:fixnum
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
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

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:action-val is deprecated.  Use i2c_communication-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'address-val :lambda-list '(m))
(cl:defmethod address-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:address-val is deprecated.  Use i2c_communication-msg:address instead.")
  (address m))

(cl:ensure-generic-function 'register-val :lambda-list '(m))
(cl:defmethod register-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:register-val is deprecated.  Use i2c_communication-msg:register instead.")
  (register m))

(cl:ensure-generic-function 'bit_start-val :lambda-list '(m))
(cl:defmethod bit_start-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:bit_start-val is deprecated.  Use i2c_communication-msg:bit_start instead.")
  (bit_start m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:length-val is deprecated.  Use i2c_communication-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <i2c>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader i2c_communication-msg:value-val is deprecated.  Use i2c_communication-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <i2c>) ostream)
  "Serializes a message object of type '<i2c>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'register)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bit_start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <i2c>) istream)
  "Deserializes a message object of type '<i2c>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'action)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'register)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bit_start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'length)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
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
  "02bbf66b000fb349dca73007c00d3fea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'i2c)))
  "Returns md5sum for a message object of type 'i2c"
  "02bbf66b000fb349dca73007c00d3fea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<i2c>)))
  "Returns full string definition for message of type '<i2c>"
  (cl:format cl:nil "Header header~%uint8 action~%uint8 address~%uint8 register~%uint8 bit_start~%uint8 length~%uint8[] value~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'i2c)))
  "Returns full string definition for message of type 'i2c"
  (cl:format cl:nil "Header header~%uint8 action~%uint8 address~%uint8 register~%uint8 bit_start~%uint8 length~%uint8[] value~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <i2c>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <i2c>))
  "Converts a ROS message object to a list"
  (cl:list 'i2c
    (cl:cons ':header (header msg))
    (cl:cons ':action (action msg))
    (cl:cons ':address (address msg))
    (cl:cons ':register (register msg))
    (cl:cons ':bit_start (bit_start msg))
    (cl:cons ':length (length msg))
    (cl:cons ':value (value msg))
))
