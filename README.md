<p align="center"><img src="https://s17.postimg.cc/kwyw37sxb/0_Hl-1_BN46_JLi_Th8_UM.png" width="300" height="350"></p>

# Raspberry Pi PHP

Raspberry PI image for running PHP7.0-FPM.

## Installed
- Git
- Composer
- PHP 7.0 FPM

## Requirements

- docker-cli

## Installation

Clone the repository:
```sh
git clone https://github.com/edenreich/raspberry-php.git && cd raspberry-php
```

And run:
```sh
docker run -it -d -p 9000:9000 --name php -w /var/www/html edenr/raspberry-php
```

To enter:
```sh
docker exec -it php
```

