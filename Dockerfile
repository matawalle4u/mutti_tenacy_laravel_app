  GNU nano 6.2                                                                                      Dockerfile                                                                                                
FROM php:8.1-fpm

WORKDIR /var/www/html

COPY . .

RUN apt-get update && \
    apt-get install -y nginx supervisor

# Install MySQL client
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

COPY docker/nginx.conf /etc/nginx/sites-available/default
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
