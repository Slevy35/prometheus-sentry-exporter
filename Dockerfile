FROM php:7.2-apache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && composer --version

COPY --chown=www-data:www-data . /var/www/html
RUN php /usr/local/bin/composer install --optimize-autoloader --no-dev
WORKDIR /var/www/html