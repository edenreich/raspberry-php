FROM resin/rpi-raspbian:stretch

MAINTAINER Eden Reich <eden.reich@gmail.com>

ENV LANG C.UTF-8

# Install common dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \ 
	apt-utils \
	software-properties-common \
	nano \
	wget \
	curl \
	zip unzip \
	git
	

# Install PHP related extentions and interpreters
RUN apt-get update && apt-get install -y --no-install-recommends \	
	imagemagick \
	php-imagick \
	sqlite sqlite3 \	
	php7.0-fpm \
	php7.0-cli \
	php7.0-json \
	php7.0-curl \
	php7.0-gd \
	php7.0-sqlite3 \
	php7.0-pgsql \
	php7.0-mysql \
	php7.0-imap \
	php7.0-xsl \
	php7.0-ldap \
	php-memcache \
	php7.0-mcrypt \
	php7.0-mbstring \
	php7.0-xml \
	php-xdebug \
	php7.0-intl \
	php-pear \
	php-geoip \
	php7.0-opcache

# Install composer package manager
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# Cleanup and permissions
RUN apt-get remove -y --purge software-properties-common \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& mkdir -p /var/www/html \
	&& chown -R www-data:www-data /var/www

# Create a directory so php-fpm can store the pid
RUN mkdir /run/php

# Add PHP-FPM configurations
ADD config/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf 
ADD config/www.conf /etc/php/7.0/fpm/pool.d/www.conf

EXPOSE 9000
CMD ["php-fpm7.0"]

