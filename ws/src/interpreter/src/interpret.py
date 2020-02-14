#!/usr/bin/env python2
import roslib; roslib.load_manifest('interpreter')
import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import Int32
from interpreter.msg import i2c

autoStatus = 0
address = 0x04
pub = 0

def move_callback(msg):
 
    address = 0x04

    if(autoStatus == 0):
       
        #These will hold the thruster values to be sent over I2c
        thruster1 = 0
        thruster2 = 0
        thruster3 = 0
        thruster4 = 0
        thruster5 = 0

        #These are the Id's of the individual thrusters that will accompany the above
        #data that is being sent (these match the ID's that are used in the embedded system arduino code)
        id1 = 11
        id2 = 12
        id3 = 13
        id4 = 14
        id5 = 15

        #The following code takes the Twist messages from the control station
        #and maps them to thruster values for sending 
        # via I2C. (these values will be between 0 and 20 - inclusive, 
        #because the Twist components will have a mangnitude of
        # at most 10)

        #Handling requests for strafing movement in XY plane
        if (msg.linear.x >= 0):
            thruster4 = msg.linear.x
            thruster2 = msg.linear.x
        elif (msg.linear.x < 0):
            thruster4 = abs(msg.linear.x) + 10
            thruster2 = abs(msg.linear.x) + 10

        if (msg.linear.y >= 0):
            thruster1 = msg.linear.y
            thruster3 = msg.linear.y
        elif (msg.linear.y < 0):
            thruster1 = abs(msg.linear.y) + 10
            thruster3 = abs(msg.linear.y) + 10

        # Handling requests for up/down movement
        if (msg.linear.z >= 0):
            thruster5 = msg.linear.z
        elif (msg.linear.z < 0):
            thruster5 = abs(msg.linear.z) + 10

        #Handling requests for turning movement (mutually exclusive from strafing)
        if (msg.angular.z < 0):
            thruster4 = abs(msg.angular.z) + 10
            thruster2 = abs(msg.angular.z)
        elif (msg.angular.z > 0):
            thruster4 = msg.angular.z
            thruster2 = msg.angular.z + 10

        #Will need to publish the following: 
        rospy.loginfo("Publishing the following for the I2C node")
        rospy.loginfo("Thruster1: %d:%d"%(id1,thruster1))
        rospy.loginfo("Thruster2: %d:%d"%(id2,thruster2))
        rospy.loginfo("Thruster3: %d:%d"%(id3,thruster3))
        rospy.loginfo("Thruster4: %d:%d"%(id4,thruster4))
        rospy.loginfo("Thruster5: %d:%d"%(id5,thruster5))
	
	#Setting up i2c messages for publishing
	msg1 = i2c()
        msg1.action = 3
	msg1.address = address
	msg1.register = id1
	msg1.value = [thruster1]

        msg2 = i2c()
        msg2.action = 3
	msg2.address = address
	msg2.register = id2
	msg2.value = [thruster2]

	msg3 = i2c()
        msg3.action = 3
	msg3.address = address
	msg3.register = id3
	msg3.value = [thruster3]

	msg4 = i2c()
        msg4.action = 3
	msg4.address = address
	msg4.register = id4
	msg4.value = [thruster4]

	msg5 = i2c()
        msg5.action = 3
	msg5.address = address
	msg5.register = id5
	msg5.value = [thruster5]

	pub.publish(msg1)
	pub.publish(msg2)
	pub.publish(msg3)
	pub.publish(msg4)
	pub.publish(msg5)

        #Note that this means that for each command from the control station (individual button press),
        #this interpreter node will parse what the control station has published and will produce a set of commands
        # for the thrusters, that it will in turn publish. Then, the I2C node will take this published information, and
        # will pass it to the arduino embedded system over I2C. The embedded system will continue to hold all thrusters 
        # in the same state until it receieves another command.



def manip_callback(msg):

    address = 0x04
    if(autoStatus == 0):
        #This is the ID of the servo that matches the one in the embedded system
        #(used for identifying this servo I2C messages)
        servoid = 10
        servoState = 0

        #The control station should be sending the correct message for controlling the manipulator,
        #So this value simply needs to be passed on to the embedded system (no manipulation required)
        servoState = msg.data

        rospy.loginfo("Publishing the following for the I2C node")
        rospy.loginfo("Manipulator: %d:%d"%(servoid,servoState))

	#Setting up I2C message for publishing
	msgServo = i2c()
        msgServo.action = 3
	msgServo.address = address
	msgServo.register = servoid
	msgServo.value = [servoState]

	pub.publish(msgServo)
	


def auto_callback(msg):
    
    #Change a global variable to reflect the new autonomous status
    #This global variable will be used to prevent the other callback functions for 
    # handling input from the control station from publishing data while the robot is
    # in auto mode.
    global autoStatus
    if(msg.data == -1):
        autoStatus = 0
    if(msg.data == 1):
        autoStatus = 1

def listener():

    
    rospy.init_node('interpreter')
    rospy.Subscriber('/move_command',Twist,move_callback)
    rospy.Subscriber('/manip_command',Int32,manip_callback)
    rospy.Subscriber('/auto_status',Int32,auto_callback)
    global pub   
    pub = rospy.Publisher('/iout',i2c,queue_size=10) 

    rospy.spin()

if __name__ == '__main__':
    listener()
