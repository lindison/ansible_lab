# Ansible Playbooks for Lab and Skill Development

These playbooks will build out a WordPress deployment. This requires five virtual machines. 

Ansible can run off the development machine (wp-dev) or locally, assuming network is propoerly configured. 

These playbooks require the following:

[ansible]  
acs  
  
[redhat]  
centos  
  
[prod:children]  
app  
db  
ha  
ha-app  
lb  
  
[dev]  
dev01  
  
[app]  
web01  
  
[db]  
db01  
  
[ha]  
web01  
web02  
db01  
  
[ha-app]  
web02  
  
[lb]  
lb01  


To update the remote_user and home directories, you can run this:

To find out what exists:
       grep -r 'ubuntu' ./ or ./*

On a single directory: 
	grep -r 'ubuntu' ./ | xargs sed -i 's/ubuntu/ubuntu/g' 

On current and all subdirectories:
	grep -R ubuntu ./* | xargs sed -i 's/ubuntu/ubuntu/g'
