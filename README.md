# Ansible Playbooks for Lab and Skill Development

These playbooks will build out a WordPress deployment. This requires five virtual machines. 

Ansible can run off the development machine (wp-dev) or locally, assuming network is configured. 

 

To update the remote_user and home directories, you can run this:

To find out what exists:
       grep -r 'ubuntu' ./ or ./*

On a single directory: 
	grep -r 'ubuntu' ./ | xargs sed -i 's/ubuntu/ubuntu/g' 

On current and all subdirectories:
	grep -R ubuntu * | xargs sed -i 's/ubuntu/ubuntu/g'
