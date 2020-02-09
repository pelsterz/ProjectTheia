#!/usr/bin/env python2

import subprocess
import time
import rospy

from smbus2 import SMBus, i2c_msg

from i2c_communication.msg import i2c

bus = None
msg = None

def callback(send_msg):
    if send_msg.action == 0: # Read
        # Get time stamp and place in header
        msg.header.stamp = rospy.Time.now()
        msg.register = send_msg.register
        
        # Use SMBus to communicate
        with SMBus(1) as bus:
            try:
                msg.value = bus.read_byte_data(send_msg.address, send_msg.register)

            # Catch error when i2c fails
            except IOError:
                # Handle IOError (Try sending message again next loop)
                print("IOError during read")

        # Publish received i2c message
        pub.publish(msg)
    
    elif send_msg.action == 1: # Read extended
        # Get time stamp and place in header
        msg.header.stamp = rospy.Time.now()
        msg.register = send_msg.register
        msg.length = send_msg.length
        
        # Use SMBus to communicate
        with SMBus(1) as bus:
            try:
                msg.value = bus.read_i2c_block_data(send_msg.address, send_msg.register, send_msg.length)

            # Catch error when i2c fails
            except IOError:
                # Handle IOError (Try sending message again next loop)
                print("IOError during extended read")

        # Publish received i2c message
        pub.publish(msg)
        
    elif send_msg.action == 2: # Write
        # Read byte then write over appropriate bits of byte
        
        # Use SMBus to communicate
        with SMBus(1) as bus:
            try:
                b = bus.read_byte_data(send_msg.address, send_msg.register)

            # Catch error when i2c fails
            except IOError:
                # Handle IOError
                print("IOError during read before write")
            
            mask = ((1 << send_msg.length) - 1) << (send_msg.bit_start - send_msg.length + 1)
            send_msg.value <<= (send_msg.bit_start - send_msg.length + 1)
            send_msg.value &= mask
            b &= ~(mask)
            b |= send_msg.value

            try:
                bus.write_byte_data(send_msg.address, send_msg.register, b)

            # Catch error when i2c fails
            except IOError:
                # Handle IOError
                print("IOError during write")

    elif send_msg.action == 3: # Write extended
        # Write two bytes
        
        # Use SMBus to communicate
        with SMBus(1) as bus:
            # Setup write message to send register and value
            write = i2c_msg.write(send_msg.address, [send_msg.register, send_msg.value])

            try:
                bus.i2c_rdwr(write)

            # Catch error when i2c fails
            except IOError:
                # Handle IOError
                print("IOError during extended write")


if __name__ == "__main__":
    # Initialize the node
    rospy.init_node('read_write_i2c', log_level=rospy.DEBUG)

    # Setup publisher
    pub = rospy.Publisher('/i2c_receive',i2c,queue_size=10)

    # Setup subscriber
    sub = rospy.Subscriber('/sensor_send',i2c,callback)

    # Setup i2c message for what was received
    msg = i2c()
    msg.header.frame_id = 'received'

    print("read_write_i2c ready")

    # Turn control over to ROS
    rospy.spin()
