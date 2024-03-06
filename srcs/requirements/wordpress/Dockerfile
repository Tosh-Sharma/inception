FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache \
    curl \
    php8 \
    php8-fpm \
    php8-mysqli \
    php8-json \
    php8-phar \
    php8-curl \
    php8-dom \
    php8-exif \
    php8-fileinfo \
    php8-mbstring \
    php8-openssl \
    php8-xml \
    php8-zip \
    php8-redis \
    wget \
    unzip

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
       /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
       /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
       /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
     unzip latest.zip && \
     cp -rf wordpress/* . && \
     rm -rf wordpress latest.zip

COPY /conf/create_users.sh .
RUN chmod +x create_users.sh

ENTRYPOINT ["/bin/sh", "create_users.sh"]
CMD ["/usr/sbin/php-fpm8", "-F"]