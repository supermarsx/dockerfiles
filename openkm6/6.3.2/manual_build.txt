# Create new openkm community image from scratch

# Start Ubuntu base image
docker run -it --name "openkm-testbuild" ubuntu:16.04

# Install needed packages, download openkm bundle and unzip
apt-get update && apt-get install -y \
wget \
unzip \
default-jre && \
wget 'http://downloads.sourceforge.net/project/openkm/6.3.2/openkm-6.3.2-community-tomcat-bundle.zip' && \
unzip openkm-6.3.2-community-tomcat-bundle.zip -d /opt/openkm/ && \
rm -rf openkm-6.3.2-community-tomcat-bundle.zip

# Commit all changes to local image and tag accordingly
docker commit -c 'CMD ["opt/openkm/tomcat/bin/catalina.sh","run"] -c "EXPOSE 8080" openkm-testbuild eduardomota/openkm6:latest
docker tag eduardomota/openkm6:latest eduardomota/openkm6:6.3.2