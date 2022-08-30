#!/bin/sh
# v0.1 - first version
# v0.2 - fix read command
# Script to download and run the SDRplay RSP API installer
# Then reboot afterwards to make sure the service has started

# clear the terminal
clear
# say what we are doing
echo "SDRplay script to download and run the RSP API Installer - v0.2"
# change to the Downloads folder
cd ~/Downloads
# download the API from the SDRplay website
wget https://www.sdrplay.com/software/SDRplay_RSP_API-ARM32-3.07.2.run
# change permission so the run file is executable
chmod 755 ./SDRplay_RSP_API-ARM32-3.07.2.run
# execute the API installer (follow the prompts)
./SDRplay_RSP_API-ARM32-3.07.2.run
# ask the user to press enter to continue
echo "Press the Enter key to reboot"
read reply
# reboot the device so that we know the service has started
sudo reboot
