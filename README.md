# Project Theia

## Setup on Pi
1. Install Raspbian onto the SD card
2. Enable SSH and I2C `Preferences >> Raspberry Pi Configuration >> Interfaces` (Enable SSH and I2C) 
3. Restart Pi
4. Install updates: ```sudo apt-get install dnsmasq-base```

## Setup on Ubuntu
1. Open the network manager: ```nm-connection-editor```

   Setup a new connection accordingly:
   1. `+` sign (Add a new connection)
   2. Ethernet
   3. Create
   4. IPv4 Settings
   5. Method: Shared to other computers
   6. Set a good name for it
   7. Save

   **No need to restart**

   Reference [SSH to RPi without a network connection?](https://raspberrypi.stackexchange.com/questions/3867/ssh-to-rpi-without-a-network-connection/53823#53823)

## Access Pi over Ethernet
1. Retrieve Raspberry Pi ip address with: ```ping raspberrypi.local```
2. Connect over SSH with: ```ssh pi@[ip address]```

## Run
