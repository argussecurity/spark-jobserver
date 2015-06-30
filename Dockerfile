FROM java:7-jre

RUN mkdir -p /home/spark/job-server
ADD job-server-extras/target/**/spark-job-server.jar /home/spark/job-server/
ADD bin/* /home/spark/job-server/
ADD job-server/config/* /home/spark/job-server/
ADD job-server/config/docker.sh /home/spark/job-server/settings.sh

ENV MESOS_NATIVE_JAVA_LIBRARY /usr/local/lib/libmesos.so
ENV ATTACHED true
CMD /home/spark/job-server/server_start.sh
