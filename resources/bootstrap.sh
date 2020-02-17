#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install git -y
sudo apt-get install zip -y
sudo apt-get install unzip -y
sudo apt-get install dos2unix -y

sudo dos2unix /vagrant/tomcat-setup.sh
sudo bash /vagrant/tomcat-setup.sh
