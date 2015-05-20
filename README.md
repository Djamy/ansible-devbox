#ansible-devbox
===============

##Prerequisite

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
* [Ansible](http://docs.ansible.com/intro_installation.html)

**NFS on Unix:** Synced folders uses NFS by default, for better performance - if your Host OS is Linux, you'll need to install nfsd.

## What's inside?
ansible-devbox comes with a full web environment with those modules preinstalled:

* nginx (and/or Apache, it's up to you)
* php-fpm
* MySQL
* composer
* Zsh and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* phptools (phpunit, phploc, ...)

##Installation

```bash
$ git clone git://github.com/Djamy/ansible-devbox.git YourDevBox
$ cd YourDevBox
```

## Configuration
After cloning the repository to your local environment, add your ssh public key to

    ansible-devbox/ansible/roles/init/files/authorized_keys

Add your name and email address to basic git config

    ansible-devbox/ansible/playbook.yml

You can edit the VagrantFile as you need and to specify your shared folder(s)

```bash
$ vim VagrantFile
```

### Nginx configuration
A default vhost is provided but if you need a Symfony2 vhost you can uncomment the line in

    ansible-devbox/ansible/vars/nginxphp.yml

## First start

```bash
$ vagrant up && vagrant ssh
```

##Infos

MySQL credentials :
* Root User : root / toor
* MySQL User : vagrant / vagrant

Useful alias :
* alias l='ls -l'
* alias ll='ls -la'
* alias ngr='service nginx restart'
* alias ngl='multitail /var/log/nginx/dev_error.log /var/log/nginx/dev_access.log'
* alias cdw='cd /var/www'
* alias cdl='cd /var/log'
* alias ..='cd ..'
* alias ...='cd ../..'
* alias ....='cd ../../..'
* alias .....='cd ../../../..'
