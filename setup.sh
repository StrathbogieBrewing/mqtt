#!/bin/bash

apt update
apt install -y podman podman-compose git wireguard ufw

ufw allow 22/tcp
ufw allow 51820/udp

mkdir -p /etc/wireguard/keys
cd /etc/wireguard/keys
umask 077
wg genkey | tee privatekey | wg pubkey > publickey

# mkdir /etc/wiregaurd/
cp wiregaurd.conf /etc/wiregaurd/

systemctl start wg-quick@wg0.service

useradd podman







# caddy start

# echo 'net.ipv4.ip_unprivileged_port_start=80' > /etc/sysctl.conf
# sysctl -p

# podman run -it -p 1883:1883 -v "$PWD/mosquitto/config:/mosquitto/config" -v /mosquitto/data -v /mosquitto/log docker.io/eclipse-mosquitto
