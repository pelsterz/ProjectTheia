#!/usr/bin/env python2

import subprocess
import time
import rospy

from smbus2 import SMBus, i2c_msg

from i2c_communication.msg import i2c

bus = None
address = 0x04

class Send:
    def __init__(self):
        self.value = 0

def callback(angle_msg):
    message.value = angle_msg.value

if __name__ == "__main__":
    # Initialize the node
    rospy.init_node('read_write_i2c', log_level=rospy.DEBUG)

    # Setup publisher
    pub = rospy.Publisher('/pot_raw',i2c,queue_size=10)

    # Setup subscriber
    sub = rospy.Subscriber('/servo_angle',i2c,callback)

    message = Send()

    msg = i2c()
    msg.header.frame_id = 'pot'

    rate = rospy.Rate(100) # Set rate

    # Loop until ROS is shutdown
    while not rospy.is_shutdown():
        # Add values to message
        msg.header.stamp = rospy.Time.now()
        
        write = i2c_msg.write(address, [message.value])
        read = i2c_msg.read(address, 2)
        with SMBus(1) as bus:
            try:
                bus.i2c_rdwr(write, read)
                value = 0
                i = 0
                for val in read:
                    value += val << 8*i
                    i += 1

                msg.value = value & 0x03FF

            except IOError:
                # Handle IOError (Try sending message again next loop)
                subprocess.call(['i2cdetect', '-y', '1'])

        pub.publish(msg)
        rate.sleep()
