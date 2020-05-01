FROM node

WORKDIR app

COPY app/. .

COPY app/package*.json ./

COPY ./entrypoint.sh /run/entrypoint.sh

# Install supervisor, cUrl
RUN apt-get update && \
		apt-get install \
		supervisor \
		curl -y && \
		chmod +x /run/entrypoint.sh

COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD /run/entrypoint.sh

VOLUME /app

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/
