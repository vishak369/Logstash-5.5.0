FROM centos:7
MAINTAINER vishakkv954@gmail.com
RUN  yum -y install wget &&\
     yum -y install java-1.8.0-openjdk-devel &&\
     wget https://artifacts.elastic.co/downloads/logstash/logstash-5.5.0.rpm &&\
     rpm -ivh logstash-5.5.0.rpm
RUN sed -i '36i some="/usr/lib/jvm/java-1.8.0-openjdk" ' /usr/share/logstash/bin/logstash.lib.sh
RUN sed -i 's/JAVA_HOME/some/g' /usr/share/logstash/bin/logstash.lib.sh
RUN sed -i '64i path.config: /usr/share/logstash/pipeline ' /etc/logstash/logstash.yml
EXPOSE 5044
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
CMD ["/usr/share/logstash/bin/logstash"]

