#!/usr/bin/env bash
set -e
echo "Post Installation Task For Kerberos - Cloudera Manager server"

mkdir /tmp/jce
cd /tmp/jce
wget wget http://10.0.10.251/repo/java/JCEPolicyJDK7/US_export_policy.jar
wget http://10.0.10.251/repo/java/JCEPolicyJDK7/local_policy.jar
mv /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/local_policy.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/local_policy.jar.orig
mv /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/US_export_policy.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/US_export_policy.jar.orig
cp /tmp/jce/local_policy.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/local_policy.jar
cp /tmp/jce/US_export_policy.jar /usr/java/jdk1.7.0_67-cloudera/jre/lib/security/US_export_policy.jar

 
#mv cmf.keytab /etc/cloudera-scm-server/
#chown cloudera-scm:cloudera-scm /etc/cloudera-scm-server/cmf.keytab
#chmod 600 /etc/cloudera-scm-server/cmf.keytab

echo "cloudera-scm/admin@COMPUTE.INTERNAL" > /etc/cloudera-scm-server/cmf.principal
chown cloudera-scm:cloudera-scm /etc/cloudera-scm-server/cmf.principal
chmod 600 /etc/cloudera-scm-server/cmf.principal
