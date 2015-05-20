#!/bin/bash
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo easy_install pip
sudo pip install ansible
sudo chmod -x /vagrant/ansible/playbook
export ANSIBLE_NOCOWS=1
sudo ansible-playbook /vagrant/ansible/playbook.yml -i /vagrant/ansible/playbook_windows --connection=local
