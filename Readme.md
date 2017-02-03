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

## Table of contents

<!-- TOC -->

- [Ionic Developer Box](#ionic-developer-box)
    - [Table of contents](#table-of-contents)
    - [How to build](#how-to-build)
        - [Easy way](#easy-way)
        - [Custom](#custom)
    - [How to update android tools.](#how-to-update-android-tools)
    - [How to attach a device.](#how-to-attach-a-device)
    - [How to solve "_Not permissions_" issue](#how-to-solve-_not-permissions_-issue)
    - [How to resolve the adb command not found when use sudo.](#how-to-resolve-the-adb-command-not-found-when-use-sudo)
    - [How to resolve the _adb unauthorized_ issue](#how-to-resolve-the-_adb-unauthorized_-issue)
- [FAQ](#faq)

<!-- /TOC -->

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


## How to update android tools.

                android update sdk --no-ui --all --filter build-tools-25.0.1,android-25,extra-android-m2repository

## How to attach a device.

Please, please please, before to continue. First: Is your android in developer mode? Have your device the adb debug mode enabled? 


The image is built with a generic usb device for Google devices and it is possible that this not works for you. In this case you can configure your own device like that:

                vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]

Change the `--name` of yours and the `--vendorid` for your device id. You can find a list of ids in this link: [https://developer.android.com/studio/run/device.html#VendorIds](https://developer.android.com/studio/run/device.html#VendorIds)

**TIP**: If you image  is already running, execute `vagrant reload`

## How to solve "_Not permissions_" issue

If you experienced the not permissions issue when run the `adb devices` command you must run the command with sudo:

1. Stop the adb server `sudo adb kill-server`
    1. If this not works for you, you can use `sudo killall adb`
        1. If your system is not capable to find the killall commmand, install psmisc first `sudo yum install -y psmisc`
2. Unplug your device.
3. Plug your device again
4. Start the adb server with `sudo adb devices`

**TIP:** If this workflow didn't work for you, you can follow this guide for a more advanced configuration [http://ptspts.blogspot.com.es/2011/10/how-to-fix-adb-no-permissions-error-on.html](http://ptspts.blogspot.com.es/2011/10/how-to-fix-adb-no-permissions-error-on.html)

## How to resolve the adb command not found when use sudo.

Use this: `sudo ./android-sdk-linux/platform-tools/adb <command>`

## How to resolve the _adb unauthorized_ issue

Check the display of you device and accept the alert of grant permissions to linked PC.

# FAQ


- After `ionic serve`, the browser is not automatic launched.

Open your browser manually and navigate to http://localhost:8100 

- My plugged device is not listed.

Please follow this guide: [Step 1](#how-to-attach-a-device) and next steps.

- I'd like to use Geanymotion emulator on my host.

Please follow this link: [https://github.com/driftyco/ionic-box/issues/17#issuecomment-57971827](https://github.com/driftyco/ionic-box/issues/17#issuecomment-57971827)

