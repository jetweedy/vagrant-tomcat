#!/usr/bin/env bash

# http://tomcat.apache.org/tomcat-7.0-doc/jndi-datasource-examples-howto.html
sudo cp /vagrant/mysql-connector-java-8.0.19.jar /opt/tomcat/latest/lib/mysql-connector-java-8.0.19.jar
sudo apt-get install -y mysql-client
sudo apt-get install -y libmysql-java

### INSTALL MSQL
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y mariadb-server
sudo mysql < /vagrant/setup.sql


