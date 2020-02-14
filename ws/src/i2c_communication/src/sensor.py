#!/usr/bin/env python2

import time
import rospy
import math
import struct

from i2c_communication.msg import i2c
from geometry_msgs.msg import Twist

address = 0x68

def bytes_to_int(input_bytes):
    uint = struct.unpack('>HHHHHHH', input_bytes)
    return uint


def callback(received):
    # Setup Twist message
    received_msg = Twist()

    if received.action == 1: # Post data from an extended read
        sensor_val = bytes_to_int(received.value)
        received_msg.linear.x = sensor_val[0]
        received_msg.linear.y = sensor_val[1]
        received_msg.linear.z = sensor_val[2]
        received_msg.angular.x = sensor_val[4]
        received_msg.angular.y = sensor_val[5]
        received_msg.angular.z = sensor_val[6]

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
    # Delay to ensure initialize messages reach i2c node
    rospy.sleep(1)
    
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

    # Setup MPU6050 if just starting
    initialize()

    # Loop until ROS is shutdown
    while not rospy.is_shutdown():
        # Get raw 6-axis motion sensor readings (accel/gyro)
        read_extended(0x3B, 14)
        
        # Sleep for prescribed amount of time
        rate.sleep()

