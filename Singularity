Bootstrap: docker
From: ubuntu:bionic

%labels
MAINTAINER Kokulapalan Wimalanathan
Version 0.1

%environment
    export LC_ALL=C
    export DEBIAN_FRONTEND=noninteractive

%files
	requirements.txt /root/
	mysqld.cnf /root/mysqld.cnf
	irods_environment.json /root/

%post
	echo "Running post.sh" 
	apt-get -q -y update
	apt-get -yq install bsdutils lsb-base mysql-client-5.7 mysql-common mysql-server-core-5.7 passwd perl psmisc debconf libc6 libevent-core-2.1-6 libgcc1 liblz4-1 libstdc++6 zlib1g 
	apt-get -q -y install build-essential less vim wget python-pip libfuse2 r-base openjdk-8-jdk libidn11-dev libssl1.0-dev libssl1.0.0

	#bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password password mysql"'
	#bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password_again password mysql"'
	## Trying different mysql install method
	apt-get download mysql-server-5.7
	dpkg --unpack mysql-server*.deb
	echo "=============================================="
	ls -lh /var/lib/dpkg/info/ | grep mysql-server
	echo "=============================================="
	
	rm -f /var/lib/dpkg/info/mysql-server-5.7.postinst
	dpkg --configure mysql-server-5.7
	apt-get install -yf mysql-server-5.7
	apt-get -yf install libmysqld-dev libmysqlclient-dev

	# R -e 'install.packages(c("data.table","futile.logger","ggplot2","ontologyIndex","reshape2","scales","jsonlite","yaml"))'
	sed -i 's/make/make -j4/g' /usr/lib/R/etc/Renviron
	R -e 'install.packages(c("data.table","futile.logger","ontologyIndex","scales","yaml"))'

	pip install -r /root/requirements.txt

	chmod 777 /var/lib/mysql

	mv /root/mysqld.cnf /etc/mysql/mysql.conf.d/

	wget ftp://ftp.renci.org/pub/irods/releases/4.1.9/ubuntu14/irods-icommands-4.1.9-ubuntu14-x86_64.deb
	dpkg -i irods-icommands-4.1.9-ubuntu14-x86_64.deb

	mkdir /root/.irods
	mv /root/irods_environment.json /root/.irods/
	cat /root/.irods/irods_environment.json
	
	echo "=============================================="
	echo "Completed Post"
	echo "=============================================="