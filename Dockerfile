FROM php:8.1-fpm

WORKDIR /var/www/html

COPY . .

RUN apt-get update && \
    apt-get install -y nginx supervisor

COPY docker/nginx.conf /etc/nginx/sites-available/default
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
