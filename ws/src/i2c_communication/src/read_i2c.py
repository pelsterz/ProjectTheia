#!/usr/bin/env python2

import smbus
import time
import rospy

from i2c_communication.msg import i2c

if __name__ == "__main__":
    # Initialize i2c
    bus = smbus.SMBus(1)
    address = 0x04

    # Initialize the node
    rospy.init_node('read_i2c', log_level=rospy.DEBUG)

    # Setup publisher
    pub = rospy.Publisher('/pot_raw',i2c,queue_size=10)

    # Set up message
    msg = i2c()
    msg.header.frame_id = 'pot'

    rate = rospy.Rate(100) # Set rate

    value = 0

    # Loop until ROS is shutdown
    while not rospy.is_shutdown():
        # Add values to message
        msg.header.stamp = rospy.Time.now()
        msg.raw = bus.read_word_data(address, 0)

        pub.publish(msg)
        rate.sleep()
