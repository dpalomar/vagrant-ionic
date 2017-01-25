# Ionic Developer Box

This box contains:

- CentOS v7 base image
- JDK 8
- ionic
- cordova
- Android SDK
- Zsh shell
- Tmux
- vim + plugins

## How to build

### Easy way

`vagrant init dpalomar/ionic; vagrant up --provider virtualbox`

### Custom

> Requirements:
> - VirtualBox
> - Git
> - Vagrant
> - vagrant-vbguest: `vagrant plugin install vagrant-vbguest`
> - vagrant-hostmanager: `vagrant plugin install vagrant-hostmanager`

1. `git clone https://github.com/dpalomar/vagrant-ionic.git`
2. `cd vagrant-ionic`
3. modify/add whatever you like
4. `vagrant up`
5. `vagrant ssh`
6. `cd /ionic-projects`
7. `ionic help`

