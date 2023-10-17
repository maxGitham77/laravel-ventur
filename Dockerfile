FROM php:8.2-apache

# This installs pdo and pdo_mysql extentions
RUN docker-php-ext-install pdo pdo_mysql
# This installs composer in the docker container
# Note: running composer inside the container is not really needed, as this tutorial assumes running the composer using composer image as
# shown in subsequent step
RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin --filename=composer

# This the working directory
WORKDIR /var/www/html

# Copy the files - the first dot means all that l am seeing and the second dot means WORKDIR /app
COPY . /var/www/html


RUN composer install

#RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

#USER laravel

# CMD php artisan serve --host=0.0.0.0

#Run the following command in the project directory:

#docker run --rm -ti -v /var/www/html/microservices/laravel-ambassador:/app:Z  composer:latest composer install

## Configure Apache (From https://github.com/laminas/laminas-mvc-skeleton/blob/2.3.x/Dockerfile)
RUN a2enmod rewrite \
    && sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf