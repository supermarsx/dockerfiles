FROM eduardomota/nginx_php-fpm:8
LABEL Maintainer="Eduardo Mota" \
      Description="Open Web Analytics + Nginx + PHP-FPM 8"

COPY ./entrypoint.sh /run/entrypoint.sh

# Install cUrl, get latest OWA and copy to html
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
  	apt-get install \
    jq -y && \
  	OWA_VERSION=$(curl -L -s -H 'Accept: application/json' https://api.github.com/repos/Open-Web-Analytics/Open-Web-Analytics/releases/latest| jq '.tag_name'| tr -d \") && \
  	curl -fsSL -o /tmp/owa.tar.gz "https://github.com/Open-Web-Analytics/Open-Web-Analytics/archive/$OWA_VERSION.tar.gz" && \
  	tar -xzf /tmp/owa.tar.gz -C /tmp && \
  	rm -rf /var/www/html/* && \
  	mv /tmp/Open-Web-Analytics-$OWA_VERSION/* /var/www/html && \
  	cp -Rv /var/www/html/ /var/www/_html && \
  	rm -rf /tmp/* && \
  	apt-get remove \
    jq -y && \
  	apt-get autoremove -y && \
  	chmod +x /run/entrypoint.sh && \
  	echo 'debconf debconf/frontend select Dialog' | debconf-set-selections

VOLUME /var/www/html

CMD /run/entrypoint.sh
