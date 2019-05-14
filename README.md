# web base
docker image for a quick start with a web server running apache 2, php, and mariadb. **please note that this image is not intended for production, if you are deploying a production website then please fix this up yourself or create your own stack. this is purely for educational purposes only**

## services

### mariadb
* mariadb

### website
* debian
* apache 2
* php7

### python
* python 3
  * pyserial
  * flask
  * flask-restful

## usage

### general
there are two scripts: `run.sh` and `stop.sh`. it's pretty self explanatory, just make sure you install `docker` and `docker-compose` before using them otherwise it won't work.

you shouldn't need to access a shell within these containers usually, but if you do then simply run `docker exec -it webbase_[service name]_1 bash`, replacing `[service name]` with the service that you wish to access.

### mariadb
hop into the mariadb container with `docker exec -it webbase_mariadb_1 bash` and use `mysql -u root -p` to get to the mariadb command line. the password for the root user is `rootpassword`, if you wish to change this then look in the `docker-compose.yml` file, it should be self explanatory where to change the password.

### website
all website files are stored in `website/html`, drop your files in there if you wish for apache to serve them. within the website if you wish to access the db, use the location `http://mariadb` which will give you access to mariadb container's database.

### python
all python files are run from `python/volume`, just make sure to name your main python script `main.py` otherwise docker won't run it. if you wish to store information in the database, for now i suggest making a RESTful API in something like flask. an example will be in the `app/api.py` file. then you will be able to access the JSON it serves through a GET request and work from there.
