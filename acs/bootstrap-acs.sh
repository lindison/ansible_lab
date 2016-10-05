#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# Create ansible user
useradd ansible
echo "ansible:ansible" | chpasswd
echo "ansible ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/ansible
chmod 0440 /etc/sudoers.d/ansible

# Create ansible home direcgtory
mkdir /home/ansible
cp /home/vagrant/.bash* /home/ansible
cp /home/vagrant/.profile /home/ansible

# Create the SSH key
mkdir /home/ansible/.ssh
cat /dev/zero | ssh-keygen -q -N ""
mv /root/.ssh/id_rsa* /home/ansible/.ssh/

# copy examples into /home/ansible (from inside the mgmt node)
ln -s /vagrant/playbooks/module01 /home/ansible/module01
ln -s /vagrant/playbooks/module02 /home/ansible/module02
ln -s /vagrant/playbooks/module03 /home/ansible/module03
ln -s /vagrant/playbooks/module04 /home/ansible/module04
ln -s /vagrant/playbooks/module05 /home/ansible/module05
ln -s /vagrant/playbooks/module06 /home/ansible/module06
ln -s /vagrant/playbooks/module07 /home/ansible/module07

# Update ownerships
chown -R ansible:ansible /home/ansible/
chmod 600 /home/ansible/.ssh/id_rsa*

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

