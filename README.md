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
   - Retrieve Ubuntu `.img` file for `armhf` from [here](https://wiki.ubuntu/com/ARM/RaspberryPi).
   - Follow the installation instructions found [here](https://www.raspberrypi.org/documentation/installation/installing-images/README.md).
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

###### Install ROS Melodic
1. Follow the install instructions found [here](http://wiki.ros.org/melodic/Installation/Ubuntu).

Reference: [Ros Melodic Morenia](https://http://wiki.ros.org/melodic#Platforms)

## Launch ROS Nodes

