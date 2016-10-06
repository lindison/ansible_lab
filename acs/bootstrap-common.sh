#!/usr/bin/env bash


# configure hosts file
cat >> /etc/hosts <<EOL

# ansible lab nodes
10.11.33.11 lb01
10.11.33.21 web01
10.11.33.22 web02
10.11.33.30 centos
10.11.33.31 dev01
10.11.33.41 db01
10.11.33.10 acs

EOL

# Create a local ubuntu user

useradd ubuntu
echo "ubuntu:ubuntu" | chpasswd
echo "ubuntu ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/ubuntu
chmod 0440 /etc/sudoers.d/ubuntu
mkdir /home/ubuntu
cp /home/vagrant/.bashrc /home/ubuntu
cp /home/vagrant/.profile /home/ubuntu
chown -R ubuntu:ubuntu /home/ubuntu

