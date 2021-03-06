#!/bin/bash

#Important tools:
#Install chrome, vscode, vivaldi
sudo apt install -y emacs zsh zsh-doc git gitk tig guake hplip-gui  emacs24-nox byobu
sudo apt install -y curl wget nmap whois encfs openssh-server gparted #luckybackup xcalib
sudo apt install -y autoconf automake libtool cmake
#sudo apt install -y android-tools-adb android-tools-fastboot #rygel rygel-preferences

#Link files
cd dotfiles; ./linkfiles_ubuntu.sh; cd ..;

#Install oh-my-zsh (Run from shell folder)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sahil87/oh-my-zsh/master/tools/install.sh)"
source ./setup/add_to_zshrc.sh
chsh -s /bin/zsh

#Making chrome-remote-desktop work
#1. Install xfce by installing "mint-meta-xfce" from package manager
#2. Run the following:
sudo apt install mint-meta-xfce
echo 'exec /usr/bin/xfce4-session "xfce4-session --session=xfce4"' >> ~/.chrome-remote-desktop-session
sudo su; echo 'export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES="1920x1200"' >> /etc/environment
##echo 'exec /etc/mdm/Xsession "cinnamon-session-cinnamon2d"' >> ~/.chrome-remote-desktop-session
# Install Chrome Remote Desktop app from chrome app store
# Download chrome remote desktop host component from the following links
# Restart Mint
# Enable desktop sharing from Chrome Remote Desktop app. It asks to set a pin to access the computer

#Important symbolic links:
ln -s /mnt ~/
ln -s /mnt/files/code ~/
ln -s ~/Dropbox/docs-sahil/code-sync ~/code/code-sync

MNTFILES=/mnt/files
ln -s $MNTFILES/docker /var/lib/docker
ln -s $MNTFILES/VirtualBox\ VMs ~/
ln -s $MNTFILES/android/Android ~/
ln -s $MNTFILES/android/.android ~/
ln -s $MNTFILES/Unity /opt/Unity

#Installing wine
https://computingforgeeks.com/how-to-install-wine-4-on-ubuntu-18-04-linux-mint-19/

#ALLOCATE SWAP SPACE:
sudo su
fallocate -l 9G /swapfile9G #OR  dd if=/dev/zero of=/swapfile bs=1M count=1024
chmod 600 /swapfile9G
mkswap /swapfile9G
swapon /swapfile9G
#Add the following entry to fstab:
/swapfile9G    swap    swap    defaults    0 0

## AWS CLI:
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/awscli.md)

## Install Java
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/java.md)

## Install Go and Hugo
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/go.md)

## Install Nodejs
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/node.md)

## Install docker
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/docker.md)

## Install virtualbox
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/virtualbox.md)

#Install Ruby(rvm) and Tmuxinator
Use steps from [here](https://github.com/sahil87/myprofile/blob/master/guides/ruby.md)

#Unity
#After installing Unity from deb by
#"dpkg -i Unity----.deb" run
#"sudo apt-get -f install" to get all dependencies

#VNC and Remmina
#sudo apt install -y remmina remmina-plugin-vnc remmina-plugin-rdp remmina-plugin-nx
#Download, install nomachine from https://www.nomachine.com/download/linux&id=1
#To install:
#sudo apt install ./nomachine_6.0.66_2_amd64.deb

#Install google drive for linux
#go get -u github.com/odeke-em/drive/cmd/drive

#Download groovy sdk from http://groovy-lang.org/download.html
#Unzip it in /mnt/files/storage/groovy-2.4.8
cd /mnt/files/storage
ln -s groovy-2.4.8 groovy

#Python
sudo apt install -y python3 python3-pip python3-setuptools
pip3 install virtualenv
pip3 install virtualenvwrapper
#Uncomment the following in myzsh_rc.sh if python is installed
#Python Settings: Use workon to list/go into a virutal env, deactivate to exit, mkvirtualenv temp to create virtual env
#export WORKON_HOME=~/code/python/.virtualenvs
#export PROJECT_HOME=~/code/python
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#source ~/.local/bin/virtualenvwrapper.sh

#Install ansible
sudo apt install -y software-properties-common python-jmespath
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

#Digikam
sudo apt install kipi-plugins5 plasma-theme-oxygen
sudo add-apt-repository -y ppa:philip5/extra
sudo apt update; sudo apt install -y digikam5

#For running swf files: https://ubuntuforums.org/showthread.php?t=2218732&page=2&p=13040642#post13040642
#So the workaround for this is to edit /usr/share/mime/packages/freedesktop.org.xml and change
#<mime-type type="application/vnd.adobe.flash.movie"> to <mime-type type="application/x-shockwave-flash">
#and then run update-mime-database /usr/share/mime
sudo su
sed  -e "s/<mime-type  type=\"application\/vnd.adobe.flash.movie\">/<mime-type  type=\"application\/x-shockwave-flash\">/g"  /usr/share/mime/packages/freedesktop.org.xml >  /usr/share/mime/packages/freedesktop.org.xml.new
mv /usr/share/mime/packages/freedesktop.org.xml /usr/share/mime/packages/freedesktop.org.xml.original
mv /usr/share/mime/packages/freedesktop.org.xml.new /usr/share/mime/packages/freedesktop.org.xml
echo "Update mime database...";
update-mime-database /usr/share/mime
echo "Mime database updated successfully! ALL DONE!";

## Link custom apps menu
# Not needed as icing task manager is now default in linuxmint
#git clone git@github.com:sahil87/custom-apps-menu.git ~/code/sahil87/custom-apps-menu
#ln -s ~/code/sahil87/custom-apps-menu ~/.local/share/cinnamon/applets/custom-apps-menu@sahil87
