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
apt-get install git -y
git clone https://github.com/lindison/playbooks_ansible/
mv playbooks_ansible /home/ubuntu/playbooks_ansible/

ln -s /home/ubuntu/playbooks_ansible/module01 /home/ubuntu/lab01
ln -s /home/ubuntu/playbooks_ansible/module02 /home/ubuntu/ lab02
ln -s /home/ubuntu/playbooks_ansible/module03 /home/ubuntu/lab03
ln -s /home/ubuntu/playbooks_ansible/module04 /home/ubuntu/lab04
ln -s /home/ubuntu/playbooks_ansible/module05 /home/ubuntu/lab05
ln -s /home/ubuntu/playbooks_ansible/module06 /home/ubuntu/lab06
ln -s /home/ubuntu/playbooks_ansible/module07 /home/ubuntu/lab07

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
10.11.33.51 aws01

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

