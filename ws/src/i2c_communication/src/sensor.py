#!/usr/bin/env python2

import time
import rospy
import math

from i2c_communication.msg import i2c

accel = 0
gyro = 0

def callback(received):
    print "Received: " + str(received.value)

if __name__ == "__main__":
    # Initialize the node
    rospy.init_node('sensor', log_level=rospy.DEBUG)

    # Setup subscriber
    sub = rospy.Subscriber('/i2c_receive',i2c,callback)

    # Setup publisher
    pub = rospy.Publisher('/sensor',i2c,queue_size=10)

    rate = rospy.Rate(100) # Set read rate

    msg = i2c()
    msg.header.frame_id = 'accelerometer'
    msg.device_address = 0x68

    # Loop until ROS is shutdown
    while not rospy.is_shutdown():
        # Add values to message
        msg.header.stamp = rospy.Time.now()
        msg.value = 0 # register + value to send to sensor

        # Sleep for prescribed amount of time
        rate.sleep()

