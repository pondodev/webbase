# web base
docker image for a quick start with a web server running apache 2, php, and mariadb

## services

###website
* debian
* apache 2
* php7
* mariadb (coming soon)

### python
* python 3
  * pyserial

## usage
there are two scripts: `run.sh` and `stop.sh`. it's pretty self explanatory, just make sure you install `docker` and `docker-compose` before using them otherwise it won't work.

all website files are stored in `website/html`, drop your files in there if you wish for apache to serve them.

all python files are run from `python/volume`, just make sure to name your main python script `main.py` otherwise docker won't run it. `[TODO] actually make this work`

you shouldn't need to access a shell within these containers, but if you do then simply run `docker exec -it webbase_[service name]_1 bash`, replacing `[service name]` with the service that you wish to access.
