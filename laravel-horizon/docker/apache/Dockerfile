FROM php:7.4-apache

RUN apt-get update -y && apt-get install -y \
        nano \
        vim \
        software-properties-common \
        apt-utils \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libjpeg-dev \
        libpng-dev \
        libpq-dev \
        libicu-dev \
        libzip-dev \
        libxml2-dev \
        libmcrypt-dev \
        libbz2-dev \
        libmosquitto-dev \
        zlib1g-dev \
        zip \
        curl \
        unzip \
        openssl \
        git \
        supervisor \
        gnupg2 \
        build-essential \
        apt-transport-https \
        ca-certificates

# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install intl pdo pdo_mysql mysqli pdo_pgsql zip soap opcache pcntl bz2 iconv gd xmlrpc
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN pecl update-channels && pecl install redis xdebug mcrypt
RUN docker-php-ext-enable intl opcache mysqli pdo pdo_mysql redis zip gd xdebug mcrypt
RUN docker-php-source delete

# Add NodeJS
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -- \
	&& apt-get install -y nodejs

# Delete Repositories
# RUN apt-get autoremove -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

#Permission to user 'www-data'
RUN chown -R www-data:www-data .
RUN chown -R www-data:www-data /var/www/html

# Apache Conf
COPY conf/vhosts.conf /etc/apache2/sites-available/000-default.conf
COPY conf/php.ini /usr/local/etc/php/php.ini

RUN a2enmod rewrite
RUN a2enmod ssl

# Supervisor Conf
COPY supervisor/horizon.conf /etc/supervisor/conf.d/horizon.conf

# Load Supervisor Conf
# RUN service supervisor start && supervisorctl reread && supervisorctl update

ENV COMPOSER_ALLOW_SUPERUSER 1

WORKDIR /var/www/html/

#APP COMMANDS
# RUN composer install
# RUN npm install && npm run dev
# RUN chown -R www-data:www-data storage bootstrap/cache && chmod -R 777 storage bootstrap/cache

# CMD [ "composer install" ]

# CMD [ "composer install && \
# npm install && npm run dev && \
# chown -R www-data:www-data storage bootstrap/cache && chmod -R 777 storage bootstrap/cache && \
# service supervisor start && supervisorctl reread && supervisorctl update && supervisorctl start horizon:*" ]

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
CMD ["apache2-foreground"]

