FROM nginx:latest
LABEL Maintainer="Eduardo Mota" \
      Description="Nginx + PHP-FPM 7.4"

# Install CPAN, cURL, supervisor, PHP-FPM 7.4
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
	  apt-get update && \
    apt-get install \
    apt-utils \
    cpanminus \
    make -y && \
  	cpanm Term::ReadLine module && \
  	apt-get install \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    wget -y && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | \
    tee /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install \
    php7.4-fpm \
    supervisor \
    curl -y && \
    php-fpm7.4 -v && \
    apt-get install \
    php7.4-common \
    php7.4-mysql \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-curl \
    php7.4-gd \
    php7.4-imagick \
    php7.4-cli \
    php7.4-dev \
    php7.4-imap \
    php7.4-mbstring \
    php7.4-opcache \
    php7.4-soap \
    php7.4-zip \
    php7.4-intl \
    php7.4-bcmath -y && \
	  apt-get autoremove -y && \
    rm /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/www/html && \
  	mkdir /run/php && \
  	echo 'debconf debconf/frontend select Dialog' | debconf-set-selections

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/fpm.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/php.ini /etc/php/7.4/fpm/conf.d/custom.ini

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www/html

COPY public_html/ /var/www/html/

EXPOSE 80

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping
