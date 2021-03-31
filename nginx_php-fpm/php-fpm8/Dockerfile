FROM nginx:latest
LABEL Maintainer="Eduardo Mota" \
      Description="Nginx + PHP-FPM 8"

# Install CPAN, cURL, supervisor, PHP-FPM 8.0
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
    php8.0-fpm \
    supervisor \
    curl -y && \
    php-fpm8.0 -v && \
    apt-get install \
    php8.0-common \
    php8.0-mysql \
    php8.0-xml \
    php8.0-xmlrpc \
    php8.0-curl \
    php8.0-gd \
    php8.0-imagick \
    php8.0-cli \
    php8.0-dev \
    php8.0-imap \
    php8.0-mbstring \
    php8.0-opcache \
    php8.0-soap \
    php8.0-zip \
    php8.0-intl \
    php8.0-bcmath -y && \
	  apt-get autoremove -y && \
    rm /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/www/html && \
  	mkdir /run/php && \
  	echo 'debconf debconf/frontend select Dialog' | debconf-set-selections

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/fpm.conf /etc/php/8.0/fpm/pool.d/www.conf

COPY conf/php.ini /etc/php/8.0/fpm/conf.d/custom.ini

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www/html

COPY public_html/ /var/www/html/

EXPOSE 80

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping
