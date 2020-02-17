#!/usr/bin/env bash

sudo apt update
sudo apt install -y default-jdk
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat



wget http://www.trieuvan.com/apache/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz -P /tmp
sudo tar xf /tmp/apache-tomcat-8.5.51.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-8.5.51 /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'

#sudo nano /etc/systemd/system/tomcat.service
sudo cp /vagrant/tomcat.service /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload
sudo systemctl start tomcat
#sudo systemctl status tomcat
#sudo systemctl enable tomcat
#sudo ufw allow 8080/tcp

#sudo nano /opt/tomcat/latest/conf/tomcat-users.xml
sudo cp /vagrant/tomcat-users.xml /opt/tomcat/latest/conf/tomcat-users.xml
sudo systemctl restart tomcat


sudo mkdir /var/www/tomcat
sudo mkdir /var/www/tomcat/test
sudo cp /vagrant/index.jsp /var/www/tomcat/test/index.jsp
sudo ln -s /var/www/tomcat/test /opt/tomcat/latest/webapps/test
sudo systemctl restart tomcat


### TO SET UP A virtual link from a /opt/tomcat/latest/webapps/___ folder to /var/www/tomcat/___
# sudo ln -s /var/www/tomcat/___ /opt/tomcat/latest/webapps/___

### To create a .war file from inside the project directory:
# jar -cvf projectname.war *

### To extract a .war file inside a project directory
# jar -xvf projectname.war


