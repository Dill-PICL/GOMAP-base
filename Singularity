Bootstrap: docker
From: ubuntu:bionic

%labels
MAINTAINER Kokulapalan Wimalanathan
Version 0.1

%environment
    export LC_ALL=C
	export DEBIAN_FRONTEND=noninteractive

%files
	post.sh /root/
	requirements.txt /root/	

%post
	echo "Running post.sh"
	/root/post.sh
