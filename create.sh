#!/bin/bash

## To remove \r line breaks in windows:
## sed -i 's/\r$//' filename

## https://discourse.roots.io/t/setting-up-sage-on-windows-8-1/4407
#fsutil behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1

## Make directories and move into /vagrant
if [ ! -d box ];
then
	mkdir "box"
	mkdir "box/www"
	mkdir "box/vagrant"
fi
cd box/vagrant

## Init vagrant within /vagrant
vagrant init ubuntu/xenial64

## Copy some resources to /vagrant for use in provision
cp ../../resources/Vagrantfile ./Vagrantfile
cp ../../resources/tomcat-setup.sh ./tomcat-setup.sh
cp ../../resources/tomcat.service ./tomcat.service
cp ../../resources/tomcat-users.xml ./tomcat-users.xml
cp ../../resources/index.jsp ./index.jsp
#cp ../../resources/apache2.conf ./apache2.conf
#cp ../../resources/apache-setup.sh ./apache-setup.sh
#cp ../../resources/lamp-setup.sh ./lamp-setup.sh
#cp ../../resources/python-setup.sh ./python-setup.sh
#cp ../../resources/mariadb-setup.sh ./mariadb-setup.sh
#cp ../../resources/node-setup.sh ./node-setup.sh
#cp ../../resources/bootstrap.sh ./bootstrap.sh
#cp ../../resources/setup.sql ./setup.sql
#cp ../../resources/nodeHelloWorld.js ./nodeHelloWorld.js
#cp ../../resources/pythonHelloWorld.py ./pythonHelloWorld.py
#cp ../../resources/phpHelloWorld.php ./phpHelloWorld.php
#cp ../../resources/package.json ./package.json


### Bring up vagrant
vagrant up

### Display Instructions and then SSH into the new box
echo "====================================================="
echo " INSTRUCTIONS:"
echo "====================================================="
echo " Your machine is now ready."
echo " Guest Port 80 is being forwarded to Host Port 8341. "
echo " Guest Port 8080 is being forwarded to Host Port 8341. "
echo " Once all setup scripts have run, you can access these demo pages: "
echo ""
echo " 			http://localhost:8341/"
echo " 			http://localhost:8341/test"
echo ""
echo "====================================================="
echo "I am now ssh-ing into it."
echo "Please wait..."
vagrant ssh

COMMENT1

