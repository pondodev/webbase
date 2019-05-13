FROM debian

# install useful utilities
RUN apt update
RUN apt -y install neovim nano git

# install server stuffs
RUN apt -y install apache2 apache2-utils
RUN apt -y install python3 python-pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

EXPOSE 80
CMD apachectl -D FOREGROUND

ADD configs/apache2.conf /etc/apache2
ADD configs/000-default.conf /etc/apache2/sites-available
