#!/bin/bash

apt update
apt install -y podman podman-compose git wireguard ufw 

ufw allow 22/tcp
ufw allow 5180/udp
ufw allow in on wg0
ufw enable

mkdir -p /etc/wireguard/keys
cd /etc/wireguard/keys
umask 077
wg genkey | tee private.key | wg pubkey > public.key
cat private.key
cat public.key
git clone https://github.com/StrathbogieBrewing/mqtt.git
cp wireguard/server/wg0.conf /etc/wireguard/
#copy keys into wg0.conf

systemctl enable wg-quick@wg0.service

adduser mosquitto
su mosquitto










# caddy start

# echo 'net.ipv4.ip_unprivileged_port_start=80' > /etc/sysctl.conf
# sysctl -p

# podman run -it -p 1883:1883 -v "$PWD/mosquitto/config:/mosquitto/config" -v /mosquitto/data -v /mosquitto/log docker.io/eclipse-mosquitto
