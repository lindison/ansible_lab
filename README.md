# Ansible Playbooks for Lab and Skill Development

These playbooks will build out a WordPress deployment. This requires five virtual machines. 

Ansible can run off the development machine (wp-dev) or locally, assuming network is propoerly configured. 

These playbooks require the following:

[wp-dev]
1 host

[wp-pb-ap]
1 host

[wp-pb-db]
1 host

[wp-ro-all]
1 host

[wp-ro-ap]
1 host

[wp-pb-all]
wp-pb-ap
wp-pb-db


To update the remote_user and home directories, you can run this:

To find out what exists:
       grep -r 'ubuntu' ./ or ./*

On a single directory: 
	grep -r 'ubuntu' ./ | xargs sed -i 's/ubuntu/ubuntu/g' 

On current and all subdirectories:
	grep -R ubuntu ./* | xargs sed -i 's/ubuntu/ubuntu/g'
