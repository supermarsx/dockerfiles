# OpenKM 6 server with tomcat (openkm official bundle) on a ubuntu base image
FROM ubuntu:16.04

MAINTAINER Eduardo Mota version:6.3.2 r0

# Packages needed for openkm installation 
RUN apt-get update && apt-get install -y \
	wget \
	unzip \
	default-jre && \
	wget 'http://downloads.sourceforge.net/project/openkm/6.3.2/openkm-6.3.2-community-tomcat-bundle.zip' && \
	unzip openkm-6.3.2-community-tomcat-bundle.zip -d /opt/openkm/ && \
	rm -rf openkm-6.3.2-community-tomcat-bundle.zip
	
# Expose main tomcat port	
EXPOSE 8080

CMD ["/opt/openkm/tomcat/bin/catalina.sh","run"]