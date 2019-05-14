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

to install docker and docker compose on a debian based system (debian, ubuntu, linux mint, etc) then you can just run `sudo apt update && sudo apt install docker docker-compose`. then run `sudo systemctl enable docker && sudo systemctl start docker` to begin the docker daemon. all that is left is to now add your user to the `docker` group by running the command `sudo usermod -aG docker $USER` and then re-logging into your user account. in theory this should all also work just fine on windows and macos, however i was only able to test and build with linux in mind, testing on both debian and arch based distros.

you shouldn't need to access a shell within these containers usually, but if you do then simply run `docker exec -it webbase_[service name]_1 bash`, replacing `[service name]` with the service that you wish to access.

### mariadb
hop into the mariadb container with `docker exec -it webbase_mariadb_1 bash` and use `mysql -u root -p` to get to the mariadb command line. the password for the root user is `rootpassword`, if you wish to change this then look in the `docker-compose.yml` file, it should be self explanatory where to change the password.

### website
all website files are stored in `website/html`, drop your files in there if you wish for apache to serve them.

within the website if you wish to access the db, use the location `mariadb` in place of where you might normally use `localhost` which will give you access to mariadb container's database.

inside of the `website/html` directory there is a file called `dbconnect.php` which has example code for connecting to the database in php. feel free to actually modify it so that it has your database's name in there and then include it each time you wish to open a new connection to the database. for example:

```php
<?php
    include "dbconnect.php";

    $query = "SELECT * FROM table";
    $result = $conn->query($query);
    echo "there are " . $result->num_rows . " rows in the table";

    $conn->close()
?>
```

### python
all python files are run from `python/volume`, just make sure to name your main python script `main.py` otherwise docker won't run it. if you wish to store information in the database, for now i suggest making a RESTful API in something like flask. an example will be in the `app/api.py` file. then you will be able to access the JSON it serves through a GET request and work from there.

if you wish to add more python pip packages to the image then simply add the package name to `requirements.txt` on a new line and restart the docker images with `./stop.sh` and `./run.sh`
