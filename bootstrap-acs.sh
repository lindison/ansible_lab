#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
apt-get -y install tree
apt-get -y install python-passlib

# route add default gw 192.168.1.1


# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant
mv /etc/ansible/hosts /etc/ansible/hosts.orig
cp /vagrant/hosts /etc/ansible/hosts

# setup /etc/ansible/ansible.cfg

cat > /etc/ansible/ansible.cfg <<EOL

[defaults]

forks          = 10
remote_port    = 22

EOL

cat >> /etc/hosts <<EOL

# vagrant environment nodes

192.168.1.131 lb01
192.168.1.141 web01
192.168.1.142 web02
192.168.1.143 web03
192.168.1.151 docker01
192.168.1.161 dev01
192.168.1.171 db01
192.168.1.172 db02

EOL

