#ansible-devbox

## Requirements

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
* [Ansible](http://docs.ansible.com/intro_installation.html)

**NFS on Unix:** Synced folders uses NFS by default, for better performance - if your Host OS is Linux, you'll need to install nfsd.

## What's in the box ?

ansible-devbox comes with a full web environment with those modules preinstalled:

* nginx (and/or Apache, it's up to you)
* php-fpm
* MySQL
* composer
* Zsh and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* some phptools (list in *ansible-devbox/ansible/roles/app/tasks/main.yml*)

## Installation

```bash
$ git clone git://github.com/Djamy/ansible-devbox.git YourDevBox
$ cd YourDevBox
```

## Configuration

After cloning the repository to your local environment, add your ssh public key to

    ansible-devbox/ansible/roles/init/files/authorized_keys

Add your name and email address to basic git config and edit some stuff in vars if needed
It's also possible to switch between a default PHP vhost or to a symfony2 vhost

```bash
$ vim ansible-devbox/ansible/vars/config.yml
```

You can edit the Vagrantfile as you need and to specify your shared folder(s) (*use NFS if you are not on Windows*)

```bash
$ vim Vagrantfile
```
Add this line to your host file
    11.11.11.11 dev.local

### NOTE
If you change your IP in the Vagrantfile, think to change it in *ansible-devbox/ansible/devbox* and in *ansible-devbox/ansible/devbox_windows* if you are on Windows.

## First start

```bash
$ vagrant up && vagrant ssh
```

## Infos

Login *(unless you already put ssh public key to the authorized_keys file as described above)* : **vagrant/vagrant**

MySQL credentials :
* Root User : **root / toor**
* MySQL User : **vagrant / vagrant**

Useful alias :
* alias l='ls -l'
* alias ll='ls -la'
* alias ngr='sudo service nginx restart'
* alias ngl='multitail /var/log/nginx/dev_local.error.log /var/log/nginx/dev_local.access.log'
* alias cdw='cd /var/www'
* alias cdl='cd /var/log'
* alias ..='cd ..'
* alias ...='cd ../..'
* alias ....='cd ../../..'
* alias .....='cd ../../../..'

## TODO

* cleaning useless conf
* uncomment the dist-upgrade line : *ansible-devbox/ansible/roles/init/tasks/main.yml*
* more tests
* Apache conf for apache users
* more DBs (MariaDB/MongoDB) ?
