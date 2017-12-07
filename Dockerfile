FROM ubuntu:16.04

RUN apt-get update -q && \
	apt install -y \
		nginx \
		git \
		php \
		php7.0-fpm \
		php7.0-cli \
		php7.0-gd \
		php7.0-curl \
		php7.0-mbstring \
		php7.0-xml \
		php7.0-zip \
		php-apcu

RUN mkdir -p /grav

COPY . /grav/

WORKDIR /grav/

RUN /grav/bin/grav install

CMD service php7.0-fpm start && nginx -g "daemon off;"

EXPOSE 80
