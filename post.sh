#!/bin/bash

apt-get -q -y update
apt-get -q -y install build-essential apt-utils debconf-utils less vim wget python-pip libfuse2 r-base openjdk-8-jdk libmysqlclient-dev libidn11-dev

# R -e 'install.packages(c("data.table","futile.logger","ggplot2","ontologyIndex","reshape2","scales","jsonlite","yaml"))'
sed -i 's/make/make -j4/g' /usr/lib/R/etc/Renviron
R -e 'install.packages(c("data.table","futile.logger","ontologyIndex","scales","yaml"))'

pip install -r /root/requirements.txt

bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password password mysql"'
bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password_again password mysql"'
apt-get -y install mysql-server

mkdir /var/lib/mysql
chmod 777 /var/lib/mysql

mv /root/mysqld.cnf /etc/mysql/mysql.conf.d/

echo "=============================================="
echo "Completed Post"
echo "=============================================="