FROM node

WORKDIR app

COPY app/. .

COPY app/package*.json ./

RUN apt-get update && \
	apt-get install supervisor curl -y && \
	npm install

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/