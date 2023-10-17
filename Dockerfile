FROM php:8.0-fpm-alpine

# This installs pdo and pdo_mysql extentions
RUN docker-php-ext-install pdo pdo_mysql
# This installs composer in the docker container
# Note: running composer inside the container is not really needed, as this tutorial assumes running the composer using composer image as
# shown in subsequent step
RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin --filename=composer

# This the working directory
WORKDIR /app

# Copy the files - the first dot means all that l am seeing and the second dot means WORKDIR /app
COPY . .


RUN composer install

#RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

#USER laravel

CMD php artisan serve --host=0.0.0.0

#Run the following command in the project directory:

#docker run --rm -ti -v /var/www/html/microservices/laravel-ambassador:/app:Z  composer:latest composer install
