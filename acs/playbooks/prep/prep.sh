#!/bin/bash


ssh-keyscan $(cat list_names) > ~/.ssh/known_hosts
for i in $(cat list_names); do sshpass -p ansible ssh-copy-id ansible@$i; done
ansible all -m ping
