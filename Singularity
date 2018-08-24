Bootstrap: docker
From: ubuntu:bionic

%labels
MAINTAINER Kokulapalan Wimalanathan
Version 1.1.0

%environment
    export LC_ALL=C
    export DEBIAN_FRONTEND=noninteractive
    export MYSQL_USER=pannzer
    export MYSQL_DATABASE=pannzer
    export MYSQL_ROOT_PASSWORD=mysql

%files
    requirements.txt
    my.cnf 

%post
	echo "Running post.sh"
	apt-get -q -y update
	apt-get -yq install bsdutils lsb-base mysql-client-5.7 mysql-common mysql-server-core-5.7 passwd perl psmisc debconf libc6 libevent-core-2.1-6 libgcc1 liblz4-1 libstdc++6 zlib1g 
	apt-get -q -y install build-essential less vim wget python-pip python3-pip libfuse2 r-base openjdk-8-jdk libidn11-dev libssl1.0-dev libssl1.0.0 git

	## Trying different mysql install method
	apt-get download mysql-server-5.7
	dpkg --unpack mysql-server*.deb
	
	rm -f /var/lib/dpkg/info/mysql-server-5.7.postinst
	dpkg --configure mysql-server-5.7
	apt-get install -yfq mysql-server-5.7
	apt-get -yq install libmysqld-dev mysql-client libmysqlclient-dev

	R -e 'install.packages(c("data.table","futile.logger","ontologyIndex","scales","yaml"), repos="https://mirror.las.iastate.edu/CRAN/", Ncpus=4, INSTALL_opts="--no-html")'

	pip install -r requirements.txt

	mkdir /var/lib/mysql-files
	rm -rf /var/lib/mysql
	mkdir -p /var/lib/mysql
	chmod 777 /var/lib/mysql
	mkdir -p /var/run/mysqld
	chmod 777 /var/run/mysqld
	mkdir -p /var/log/mysql

	mv /etc/mysql /etc/mysqld
	mkdir -p /etc/mysql
	mv my.cnf /etc/mysql

	wget ftp://ftp.renci.org/pub/irods/releases/4.1.9/ubuntu14/irods-icommands-4.1.9-ubuntu14-x86_64.deb
	dpkg -i irods-icommands-4.1.9-ubuntu14-x86_64.deb


	echo "=============================================="
	echo "Completed Post" 
	echo "=============================================="
