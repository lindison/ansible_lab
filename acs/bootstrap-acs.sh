#!/usr/bin/env bash

# install ubuntu (http://docs.ubuntu.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# Create ubuntu user
useradd ubuntu
echo "ubuntu:ubuntu" | chpasswd
echo "ubuntu ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/ubuntu
chmod 0440 /etc/sudoers.d/ubuntu

# Create ubuntu home direcgtory
mkdir /home/ubuntu
cp /home/vagrant/.bash* /home/ubuntu
cp /home/vagrant/.profile /home/ubuntu

# Create the SSH key
mkdir /home/ubuntu/.ssh
cat /dev/zero | ssh-keygen -q -N ""
mv /root/.ssh/id_rsa* /home/ubuntu/.ssh/

# copy examples into /home/ubuntu (from inside the mgmt node)
ln -s /vagrant/playbooks/module01 /home/ubuntu/module01
ln -s /vagrant/playbooks/module02 /home/ubuntu/module02
ln -s /vagrant/playbooks/module03 /home/ubuntu/module03
ln -s /vagrant/playbooks/module04 /home/ubuntu/module04
ln -s /vagrant/playbooks/module05 /home/ubuntu/module05
ln -s /vagrant/playbooks/module06 /home/ubuntu/module06
ln -s /vagrant/playbooks/module07 /home/ubuntu/module07

# Update ownerships
chown -R ubuntu:ubuntu /home/ubuntu/
chmod 600 /home/ubuntu/.ssh/id_rsa*

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

# configure ansible default hosts file
cp /etc/ansible/hosts /etc/ansible/hosts.orig
rm /etc/ansible/hosts
cat >> /etc/ansible/hosts <<EOL

[dev]
dev01

[prod]
web01
db01

[ha]
web01
web02
db01

EOL

