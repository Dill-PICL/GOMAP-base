#!/bin/bash

apt-get -q -y update
apt-get -q -y install debconf-utils less vim wget python-pip libfuse2 r-base openjdk-8-jdk

# R -e 'install.packages(c("data.table","futile.logger","ggplot2","ontologyIndex","reshape2","scales","jsonlite","yaml"))'
sed -i 's/make/make -j4/g' /usr/lib/R/etc/Renviron
R -e 'install.packages(c("data.table","futile.logger","ontologyIndex","scales","yaml"))'

pip install -r /root/requirements.txt
