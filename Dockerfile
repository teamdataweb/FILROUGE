FROM wordpress:6.4-apache

RUN apt-get update -y && apt-get install zip -y

ADD ./www-html /var/www/html

RUN /bin/sh -c set -eux; \
    cd /var/www/html; \
    unzip wordpress.zip; \
    cp -r wordpress/*  /var/www/html/;  \
    rm -r wordpress/ ; rm wordpress.zip ;

RUN chown -R www-data:www-data /var/www/html