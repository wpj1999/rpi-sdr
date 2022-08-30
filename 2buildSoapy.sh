#!/bin/sh
# v0.1 - first version
# v0.2 - fix read command
# Script to download, build and install SoapySDR framework
# Then to the same for SoapySDRPlay and finally test everything works

# clear the terminal
clear
# say what we are doing
echo "SDRplay script to download and build SoapySDR - v0.2"
# make the ~/Dev folder (but only if it doesn't already exist)
mkdir -p ~/Dev
# change to the Dev folder
cd ~/Dev
# remove any previous SoapySDR folder
rm -rf SoapySDR
# we need cmake and swig to build SoapySDR
sudo apt install cmake swig -y
# download SoapySDR code
git clone https://github.com/pothosware/SoapySDR
# change to the SoapySDR folder
cd SoapySDR
# create build folder
mkdir build
# change to the build folder
cd build
# use cmake to create the build files
cmake ..
# start the compiler
make
# install SoapySDR into the system folders
sudo make install
# refresh the library path variable so we can use the library
sudo ldconfig
# ask the user to press Enter to continue
echo "SoapySDR build finished. Press the Enter key to continue"
read reply
# change to the Dev folder again
cd ~/Dev
# remove any previous SoapySDRPlay folder
rm -rf SoapySDRPlay
# download SoapySDRPlay (for API 3)
git clone https://github.com/SDRplay/SoapySDRPlay
# change to the SoapySDRPlay folder
cd SoapySDRPlay
# create the build folder
mkdir build
# change to the build folder
cd build
# use cmake to create the build files
cmake ..
# start the compiler
make
# install SoapySDRPlay library into the SoapySDR framework
sudo make install
# refresh the library path variable so we can use the library
sudo ldconfig
# ask the user to press the Enter key to continue
echo "Make sure the RSP is connected and press the Enter key to test SoapySDR framework"
read reply
# now lets test that SoapySDR/SoapySDRPlay works
SoapySDRUtil --probe="driver=sdrplay"
