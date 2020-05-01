FROM ubuntu:16.04
LABEL Maintainer="Eduardo Mota" \
      Description="OpenKM 6.3.2 bundle on Ubuntu 16.04"

# Install required packages for OpenKM
RUN apt-get update && apt-get install -y \
	wget \
	unzip \
	default-jre && \
	wget 'http://downloads.sourceforge.net/project/openkm/6.3.2/openkm-6.3.2-community-tomcat-bundle.zip' && \
	unzip openkm-6.3.2-community-tomcat-bundle.zip -d /opt/openkm/ && \
	rm -rf openkm-6.3.2-community-tomcat-bundle.zip

EXPOSE 8080

CMD /opt/openkm/tomcat/bin/catalina.sh run
