#!/bin/bash

apt install caddy podman certbot

caddy start


podman run -it -p 1883:1883 -v "$PWD/mosquitto/config:/mosquitto/config" -v /mosquitto/data -v /mosquitto/log docker.io/eclipse-mosquitto
