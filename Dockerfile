FROM php:7.2-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        wget unzip git \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysqli \
    && a2enmod rewrite

RUN cd /var/www \
    && rm -rf html \
    && git clone https://github.com/effgarces/BookedScheduler.git html \
    && cd html \
    && git checkout 2.8.5.1 \
    && chown -R www-data:www-data .
