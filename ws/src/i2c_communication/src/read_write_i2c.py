#!/usr/bin/env python2

import smbus
import time
import rospy

from i2c_communication.msg import i2c

bus = None
address = 0x04

def callback(angle_msg):
    bus.write_byte(address, angle_msg.value)

def timer(event):
    # Set up message
    msg = i2c()
    msg.header.frame_id = 'pot'
    
    # Add values to message
    msg.header.stamp = event.current_real
    msg.value = bus.read_word_data(address, 0) & 0x03FF

    pub.publish(msg)

if __name__ == "__main__":
    # Initialize i2c
    bus = smbus.SMBus(1)

    # Initialize the node
    rospy.init_node('read_write_i2c', log_level=rospy.DEBUG)

    # Setup publisher
    pub = rospy.Publisher('/pot_raw',i2c,queue_size=10)

    # Setup subscriber
    sub = rospy.Subscriber('/servo_angle',i2c,callback)

    # Setup timer
    rospy.Timer(rospy.Duration(0.01), timer)

    #Turn control over to ROS
    rospy.spin()
