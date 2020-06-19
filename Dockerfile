FROM php:7.4.7-fpm-alpine3.12

RUN apk add bash && apk add git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN rm -rf /var/www/html
RUN ln -s public html

# Create a group and user
RUN addgroup -S --gid 1000 apigroup && adduser -S --uid 1000 apiuser -G apigroup

# Tell docker that all future commands should run as the apiuser user
USER apiuser

EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]
