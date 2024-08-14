# how to setup development environment

1. install vscode and docker-desktop
2. execute `install-mysql-phpmyadmin.sh`, this script will setup docker network as well as local database for you
3. go to `docker-compose.yaml`, go to `volumes` section, change the mapping directory to suit your case
4. press `F1`, click `reopen in container`