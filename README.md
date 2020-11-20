# Booked Scheduler on Docker
Booked Scheduler is/was a open-source room scheduling/booking tool. We would like to run this in a Docker-ized environment. So here's a Dockerfile to make that happen.

## Trying this out
```
wget -O config.php https://github.com/effgarces/BookedScheduler/raw/2.8.5.1/config/config.dist.php
docker run -d --name booked-db -e MYSQL_ROOT_PASSWORD=passw0rd -e MYSQL_DATABASE=booked -e MYSQL_USER=booked -e MYSQL_PASSWORD=passw0rd  mariadb
docker run -d --name booked-app -v $(pwd)/config.php:/var/www/html/config/config.php -v $(pwd)/upload:/var/www/html/upload --link booked-db:mysql -p 8000:80 booked:2.8.5.1
```
