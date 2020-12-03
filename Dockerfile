FROM php:7-apache
#Install git

# Modules that this needs
RUN apt-get update && apt-get install -y git netcat && apt-get clean -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite
# Copy all of the files in
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
COPY . /var/www/html

RUN chown -R 1000 /var/www/html

RUN sed -i 's/Listen 80/Listen 9999/g' /etc/apache2/ports.conf
COPY curriki-mod-init.sh /usr/local/bin/
RUN service apache2 restart
EXPOSE 9999
