#!/usr/bin/env bash
set -e
echo "Set cloudera-manager.repo to CM v5"
yum clean all
RELEASEVER=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release))
rpm --import http://10.0.10.251/repo/cdhversion/cdh5/redhat/$RELEASEVER/x86_64/cdh/RPM-GPG-KEY-cloudera
wget http://10.0.10.251/repo/cdhversion/cm5/redhat/$RELEASEVER/x86_64/cm/cloudera-manager.repo -O /etc/yum.repos.d/cloudera-manager.repo
wget http://10.0.10.251/repo/cdhversion/cdh5/redhat/$RELEASEVER/x86_64/cdh/cloudera-cdh5.repo -O /etc/yum.repos.d/cloudera-cdh5.repo
yum install -y oracle-j2sdk* cloudera-manager-{daemons,agent}
