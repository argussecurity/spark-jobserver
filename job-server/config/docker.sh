# Environment and deploy file
# For use with bin/server_deploy, bin/server_package etc.
DEPLOY_HOSTS="hostname1.net
              hostname2.net"

APP_USER=spark
APP_GROUP=spark
# optional SSH Key to login to deploy server
#SSH_KEY=/path/to/keyfile.pem
INSTALL_DIR=/home/spark/job-server
LOG_DIR=/var/log/job-server
PIDFILE=spark-jobserver.pid
DRIVER_MEMORY=1G
SPARK_VERSION=${SPARK_VERSION} # TODO: env
SPARK_HOME=${SPARK_HOME:-/home/spark/spark-0.8.0} # TODO: volume # TODO: env
SPARK_CONF_DIR=$SPARK_HOME/conf

# Only needed for Mesos deploys
#SPARK_EXECUTOR_URI=/home/spark/spark-0.8.0.tar.gz
SPARK_MESOS_EXECUTOR_HOME=$SPARK_HOME

# Only needed for YARN running outside of the cluster
# You will need to COPY these files from your cluster to the remote machine
# Normally these are kept on the cluster in /etc/hadoop/conf
# YARN_CONF_DIR=/pathToRemoteConf/conf

SCALA_VERSION=2.10.4 # or 2.11.6