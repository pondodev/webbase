FROM debian

# install useful utilities
RUN apt update
RUN apt -y install neovim nano

# install server stuffs
RUN apt -y install apache2 apache2-utils

EXPOSE 80
CMD apachectl -D FOREGROUND

COPY site/ /var/www/html
