FROM php:8.1-apache

RUN apt-get update && \
    apt-get install -y git zip libpng-dev libzip-dev libssl-dev openssh-client nano npm default-mysql-client

RUN docker-php-ext-install mysqli gd zip pdo_mysql bcmath

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --  && \
    mv /usr/local/bin/composer.phar /usr/local/bin/composer

RUN mkdir /var/www/logs && \
    chmod 777 /var/www/logs