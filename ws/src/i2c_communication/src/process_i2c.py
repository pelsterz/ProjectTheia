#!/usr/bin/env python2

import time
import rospy

from i2c_communication.msg import i2c

def callback(raw_msg):
    print "test"
    msg = i2c()
    msg.header.frame_id = 'angle'
    msg.header.stamp = rospy.Time.now()

    # Map the raw value from the pot to an angle for the servo
    msg.value = 180 * (raw_msg.value/1023)

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
