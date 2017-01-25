#!/bin/bash

ANDROID_SDK_FILENAME=tools_r25.2.3-linux.zip
ANDROID_SDK=https://dl.google.com/android/repository/$ANDROID_SDK_FILENAME

sudo yum update -y
sudo yum install -y unzip libstdc++* zlib* libncurses* java-1.8.0-openjdk-devel ant expect expectk


cd /home/vagrant



curl -O $ANDROID_SDK
mkdir android-sdk-linux/
unzip $ANDROID_SDK_FILENAME -d android-sdk-linux/
chown -R vagrant android-sdk-linux/

rm $ANDROID_SDK_FILENAME

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64/" >> /home/vagrant/.zshrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.zshrc

source ~/.zshrc
zsh

#npm install -g npm
#npm install -g yo bower gulp-cli 
npm install -g cordova ionic

expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-22,build-tools-22.0.1
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'
sudo yum clean headers
sudo yum clean packages

sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.zsh_history && exit

echo "*************************************************************************"
echo "***********************INSTALL COMPLETE**********************************"
echo "*************************************************************************"
echo "*                    Run vagrant ssh to start"
echo "* First time you could run next command to configure vim "
echo "*               vim +PluginInstall +qall"
echo "*"
echo "**REMEMBER:** If you like create projects with shared folders in windows"
echo "* You must run vagrant up with administrator rights"
echo "*"
echo "* To start a ionic project use ionic create into /ionic-projects folder"
echo "*"
echo "* Run exit and vagrant halt to shutdown"
echo "*************************************************************************"
echo "Author: David Palomar"
echo "*****************************ENJOY***************************************"