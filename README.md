# Project Theia

## Setup on Ubuntu
Open the network manager with the command: 
```
$ nm-connection-editor
```

Setup a new connection accordingly:
1. `+` sign (Add a new connection)
2. Ethernet
3. Create
4. IPv4 Settings
5. Method: Shared to other computers
6. Set a good name for it
7. Save

**No need to restart**

Reference: [SSH to RPi without a network connection?](https://raspberrypi.stackexchange.com/questions/3867/ssh-to-rpi-without-a-network-connection/53823#53823)

## Setup on Pi

###### Setup for SSH
1. Install Ubuntu 18.04 (Bionic) Server on Pi
   - Retrieve Ubuntu `.img` file for `armhf` from [here](https://wiki.ubuntu/com/ARM/RaspberryPi)
   - Follow the installation instructions found [here](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)
2. Default login:
   - username: ubuntu
   - password: ubuntu
     - It will ask you to create a new password
3. Enable SSH by entering the command:
```
$ sudo apt install ssh
```

###### Access Pi over Ethernet (SSH)
1. Run the command:
```
$ sudo apt install net-tools
```
2. Retrieve ip address with the command: 
```
$ arp -a
```
   - Connected device name is likely `enp4s0`
3. Connect over SSH with the command:
```
$ ssh ubuntu@[ip address]
```
   - May be asked to update the host key (follow the instructions presented)
4. Login with:
   - username: ubuntu
   - password: [your password]

###### Setup for I2C
1. Install i2c-tools with:
```
$ sudo apt-get install i2c-tools
```
2. Probe the i2c-1 bus with:
```
$ sudo i2cdetect -y 1
```
   - The command should result in an empty grid as follows (since no i2c devices are connected)
```
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --  
```

Reference: [rPi3 and I2c,SPI](https://ubuntu-mate.community/t/rpi3-and-i2c-spi/4541)

3. Install python-smbus with:
```
$ sudo apt-get install python-smbus
```
   - Allows us to use I2C with python

4. Enable kernel I2C module with:
```
$ sudo nano /etc/modules
```
   - Update the file to contain:
```
# /etc/modules: kernel modules to load at boot time.
#
# This file contains the names of kernel modules that should be loaded
# at boot time, one per line. Lines beginning with "#" are ignored.
# Parameters can be specified after the module name.

snd-bcm2835
i2c-dev
```
5. Allow user access to I2C devices with:
```
$ sudo adduser ubuntu i2c
```
   - Reboot with:
```
$ sudo reboot
```

Reference: [RaspberryPI Ros](http://www.takktile.com/tutorial:raspberrypi-ros)

###### Test I2C Connection
1. Wire the Raspberry Pi to the Arduino UNO
```
RPI               Arduino (Uno/Duemillanove)
--------------------------------------------
GPIO 0 (SDA) <--> Pin 4 (SDA)
GPIO 1 (SCL) <--> Pin 5 (SCL)
Ground       <--> Ground
```
2. Load test sketch onto Arduino found [here](archive/arduino_client_test/arduino_client_test.ino)
   - Sketch puts Arduino into slave mode
3. Create test script in Python found [here](archive/i2c_comms_test.py)
   - Script puts Raspberry Pi into master mode
4. Make Python script executable with the command:
```
$ chmod -x i2c_comms_test.py
```
5. Run the python script with the command:
```
$ sudo ./i2c_comms_test.py
```
6. Input a number to test the connection
   - Response will be seen in the terminal
   - Print statements can also be seen in the Arduino Monitor

## Setup ROS on the Pi

###### Install ROS Melodic
1. Follow the install instructions found [here](http://wiki.ros.org/melodic/Installation/Ubuntu).
   - Follow installation instructions 1.2 - 1.7
   - Install the ROS-Base configuration

Reference: [Ros Melodic Morenia](https://http://wiki.ros.org/melodic#Platforms)

###### Setup ROS Workspace
1. Create workspace directory
2. Enter workspace directory
3. Create `src` directory
4. Run the command:
```
$ catkin_make
```

###### I2C Through ROS
1. Download repository
2. Run `catkin_make`
3. Install the [arduino_client](/archive/arduino_client/arduino_client.iso) on the UNO
4. Install smbus2 with:
```
$ pip install smbus2
```
   - Install pip if needed
5. Run ROS with:
```
roslaunch i2c_communication i2c_communication.launch
```
