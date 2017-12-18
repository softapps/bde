#!/usr/bin/env bash
set -e
echo "Post Installation Task For Kerberos - Cloudera Manager server"
mv ~/cmf.keytab /etc/cloudera-scm-server/
chown cloudera-scm:cloudera-scm /etc/cloudera-scm-server/cmf.keytab
chmod 600 /etc/cloudera-scm-server/cmf.keytab
echo "cloudera-scm/admin@COMPUTE.INTERNAL" > /etc/cloudera-scm-server/cmf.principal
chown cloudera-scm:cloudera-scm /etc/cloudera-scm-server/cmf.principal
chmod 600 /etc/cloudera-scm-server/cmf.principal
