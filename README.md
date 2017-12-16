# main
PROGRAMMING

Directory containing the whole project executed at the start of the Raspi Zero W

The Raspberry PI Zero was initialized using this tutorial : http://gnutoolchains.com/raspberry/tutorial/

The toolchain was installed on Eclipse using this tutorial : http://www.gurucoding.com/en/raspberry_pi_eclipse/raspberry_pi_cross_compilation_in_eclipse.php

- Toolchain prefix : arm-linux-gnueabihf-
- Toolchain path   : C:\SysGCC\Raspberry\bin

NODE SETUP

1) Make the Raspberry PI Zero Headless

- Flash the SD Card with the latest Debian (Stretch)
- Edit the /boot partition accessible on Windows and add those two files
    - "ssh" : An empty file called SSH to enable SSH on boot
    - "wpa_supplicant.conf" : A file containing the Wifi configuration of your router access.
    
 [wpa_supplicant.conf]
 
########## BEGINNING OF wpa_supplicant.conf #################

ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev

network={
	ssid="YourRouterSSID"
	psk="YourSecurePassword"
	scan_ssid=1
	key_mgmt=WPA-PSK
}

######################### EOF ###############################

2) Install softwares needed for the camera and OpenCV

OpenCV was installed using this tutorial without the virtual environnement :
https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/


