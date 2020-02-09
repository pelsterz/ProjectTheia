#!/usr/bin/env python2

import time
import rospy
import math

from i2c_communication.msg import i2c
from geometry_msgs.msg import Twist

address = 0x68

def callback(received):
    # Setup Twist message
    received_msg = Twist()

    if received.action == 1: # Post data from an extended read
        received_msg.linear.x = (received.value[0] << 8) | received.value[1]
        received_msg.linear.y = (received.value[2] << 8) | received.value[3]
        received_msg.linear.z = (received.value[4] << 8) | received.value[5]
        received_msg.angular.x = (received.value[8] << 8) | received.value[9]
        received_msg.angular.y = (received.value[10] << 8) | received.value[11]
        received_msg.angular.z = (received.value[12] << 8) | received.value[13]

        pub.publish(received_msg)


def read(register):
    msg = i2c()
    msg.header.frame_id = 'accelerometer'
    msg.address = address

    msg.header.stamp = rospy.Time.now()
    msg.action = 0 # Read
    msg.register = register
    
    pub_i2c.publish(msg)


def read_extended(register, length):
    msg = i2c()
    msg.header.frame_id = 'accelerometer'
    msg.address = address

    msg.header.stamp = rospy.Time.now()
    msg.action = 1 # Extended read
    msg.register = register
    msg.length = length
    
    pub_i2c.publish(msg)


def write(register, bit_start, length, value):
    msg = i2c()
    msg.header.frame_id = 'accelerometer'
    msg.address = address

    msg.header.stamp = rospy.Time.now()
    msg.action = 2 # Write
    msg.register = register
    msg.bit_start = bit_start
    msg.length = length
    msg.value = [value]
    
    pub_i2c.publish(msg)


def initialize():
    print("Initialize sensor begun")
    write(0x6B, 2, 3, 0x01) # Set the clock source to be the X Gyro
    write(0x1B, 4, 2, 0x00) # Set the gyroscope to its most sensitive setting
    write(0x1C, 4, 2, 0x00) # Set the accelerometer to its most sensitive setting
    write(0x6B, 6, 1, 0x00) # Take device out of sleep mode
    print("Initialize sensor complete")


if __name__ == "__main__":
    # Initialize the node
    rospy.init_node('sensor', log_level=rospy.DEBUG)

    # Setup subscriber
    sub = rospy.Subscriber('/i2c_receive',i2c,callback)

    # Setup publisher
    pub_i2c = rospy.Publisher('/sensor_send',i2c,queue_size=10)

    pub = rospy.Publisher('/sensor_data',Twist,queue_size=10)

    rate = rospy.Rate(1) # Set read rate (Hz)

    # Setup MPU6050
    initialize()

    # Loop until ROS is shutdown
    while not rospy.is_shutdown():
        # Get raw 6-axis motion sensor readings (accel/gyro)
        read_extended(0x3B, 14)

        # Sleep for prescribed amount of time
        rate.sleep()

