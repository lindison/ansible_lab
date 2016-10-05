#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)

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

# Create a local ansible user

useradd ansible
echo "ansible:ansible" | chpasswd
echo "ansible ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/ansible
chmod 0440 /etc/sudoers.d/ansible
mkdir /home/ansible
cp /home/vagrant/.bashrc /home/ansible
cp /home/vagrant/.profile /home/ansible
chown -R ansible:ansible /home/ansible

