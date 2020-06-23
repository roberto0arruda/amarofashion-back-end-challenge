FROM php:7.4.7-fpm-alpine3.12

RUN apk --no-cache update \
    && apk --no-cache upgrade \
    && apk add bash && apk add git

RUN docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
RUN rm -rf /var/www/html
RUN ln -s public html

# Create a group and user
RUN addgroup -S --gid 1000 roberto && adduser -S --uid 1000 roberto -G roberto sudo

# Tell docker that all future commands should run as the roberto user
USER roberto

EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]
