<p align="center"><img src="https://s9.postimg.cc/7v1kgl8tr/raspberry-docker-php.png"></p>

# Raspberry Pi PHP

Raspberry PI docker image for running PHP7.0-FPM.

## Installed
- Git
- Composer
- PHP 7.0 FPM

## Requirements

- docker-cli

## Usage

On the command line:
```sh
docker run -it -d -p 9000:9000 --name php -w /var/www/html edenr/raspberry-php
```

To enter:
```sh
docker exec -it php bash
```

## Links

- https://hub.docker.com/r/edenr/raspberry-php/

