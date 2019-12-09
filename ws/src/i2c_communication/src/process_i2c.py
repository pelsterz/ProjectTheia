#!/usr/bin/env python2

import time
import rospy
import math

from i2c_communication.msg import i2c

def arduino_map(x, in_min, in_max, out_min, out_max):
    return (x - in_min) * (out_max - out_min) // (in_max - in_min) + out_min

def callback(raw_msg):
    print "Process: " + str(raw_msg.value)
    
    msg = i2c()
    msg.header.frame_id = 'angle'
    msg.header.stamp = rospy.Time.now()

    # Map the raw value from the pot to an angle for the servo
    msg.value = arduino_map(raw_msg.value, 1023, 0, 0, 180)
    
    print "Result: " + str(msg.value)

    pub.publish(msg)

if __name__ == "__main__":
    # Initialize the node
    rospy.init_node('process_i2c', log_level=rospy.DEBUG)

    # Setup subscriber
    sub = rospy.Subscriber('/pot_raw',i2c,callback)

    # Setup publisher
    pub = rospy.Publisher('/servo_angle',i2c,queue_size=10)

    # Turn control over to ROS
    rospy.spin()
