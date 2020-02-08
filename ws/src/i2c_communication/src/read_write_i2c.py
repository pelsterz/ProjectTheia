#!/usr/bin/env python2

import subprocess
import time
import rospy

from smbus2 import SMBus, i2c_msg

from i2c_communication.msg import i2c

bus = None

def callback(send_msg):
    # Get time stamp and place in header
    msg.header.stamp = rospy.Time.now()
    
    # Setup write message and read message
    # Write message sends out value on address
    write = i2c_msg.write(send_msg.address, send_msg.value)
    # Read message receives two bytes from address
    read = i2c_msg.read(send_msg.address, 2)

    # Use SMBus to communicate
    with SMBus(1) as bus:
        try:
            bus.i2c_rdwr(write, read)

            # Arrange received 16-bit value
            value = 0
            i = 0
            for val in read:
                value += val << 8*i
                i += 1

            msg.value = value & 0x03FF

        # Catch error when i2c fails
        except IOError:
            # Handle IOError (Try sending message again next loop)
            subprocess.call(['i2cdetect', '-y', '1'])

    # Publish received i2c message
    pub.publish(msg)


if __name__ == "__main__":
    # Initialize the node
    rospy.init_node('read_write_i2c', log_level=rospy.DEBUG)

    # Setup publisher
    pub = rospy.Publisher('/i2c_receive',i2c,queue_size=10)

    # Setup subscriber
    sub = rospy.Subscriber('/sensor',i2c,callback)

    # Setup i2c message for what was received
    msg = i2c()
    msg.header.frame_id = 'received'

    # Turn control over to ROS
    rospy.spin()
