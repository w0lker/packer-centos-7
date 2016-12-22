#!/usr/bin/env bash

temp_files="packer_cache
output-virtualbox-iso
/usr/local/etc/ansible/roles/*
/etc/ansible/roles/*"

case $1 in
    clean)
	for temp_file in $temp_files; do
	    echo "rm -rf $temp_file"
	    rm -rf $temp_file
	done
	;;
    make)
	ansible-galaxy install -r requirements.txt
	packer build centos7.json
	;;
    install)
	vagrant box add w0lker/centos7 *-centos7.box
	;;
    *)
	echo "Usage: build.sh [make|install|clean]"
	;;
esac
