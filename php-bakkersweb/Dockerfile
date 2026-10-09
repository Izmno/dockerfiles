FROM php:5.6-apache

# Debian stretch is EOL and only served from archive.debian.org. Its Release
# file is expired and can no longer be authenticated, so mark the repo trusted
# and skip the Valid-Until check; otherwise apt refuses to install anything.
RUN echo "deb [trusted=yes] http://archive.debian.org/debian stretch main" > /etc/apt/sources.list

# Install system dependencies for PHP extensions and other utilities
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libpng-dev \
    libxslt1-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install \
    calendar \
    exif \
    gettext \
    mysql \
    mysqli \
    pcntl \
    pdo_mysql \
    shmop \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    wddx

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install and enable Zend OPcache
RUN docker-php-ext-install opcache \
    && docker-php-ext-enable opcache

# Install and enable the GD library
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd

# Clean up to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Your application's Docker setup might require additional customizations from here

# Change the default Apache port to 8080 so the container can run without root privileges
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf