#!/bin/sh
# v0.1 - first version
# v0.2 - fix read command
# Script to download, build and install the Widgets for CubicSDR

# clear the terminal
clear
# say what we are doing
echo "SDRplay script to download and build CubicSDR - v0.2"
# make the ~/Dev folder (but only if it doesn't already exist)
mkdir -p ~/Dev
# change to the Dev folder
cd ~/Dev
# download and install hamlib and alsa sound libraries
sudo apt install libhamlib-dev libasound2-dev -y
# remove CubicSDR folder (if it previously exists)
rm -rf CubicSDR
# download CubicSDR code
git clone https://github.com/cjcliffe/CubicSDR
# change to the CubicSDR folder
cd CubicSDR
# create the build folder
mkdir build
# change to the build folder
cd build
# create the build files
cmake .. -DCMAKE_BUILD_TYPE=Release -DUSE_HAMLIB=1 -DOTHER_LIBRARIES="-latomic" -DUSE_AUDIO_PULSE=0 -DUSE_AUDIO_OSS=0 -DUSE_AUDIO_ALSA=1 -DwxWidgets_CONFIG_EXECUTABLE=~/Dev/wxWidgets-staticlib/bin/wx-config
# start the compiler
make
# install the CubicSDR files
sudo make install
# ask the user to press any key to continue
echo "Press the Enter key to reboot - CubicSDR will then be in the menu (Other)"
read reply
# reboot the machine
sudo reboot
