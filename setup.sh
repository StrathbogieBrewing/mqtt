#!/bin/bash

apt install caddy podman certbot

caddy start

echo 'net.ipv4.ip_unprivileged_port_start=80' > /etc/sysctl.conf
sysctl -p

podman run -it -p 1883:1883 -v "$PWD/mosquitto/config:/mosquitto/config" -v /mosquitto/data -v /mosquitto/log docker.io/eclipse-mosquitto
