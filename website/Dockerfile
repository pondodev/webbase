FROM php:apache-stretch

# enable mysqli
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

EXPOSE 80
CMD apachectl -D FOREGROUND
