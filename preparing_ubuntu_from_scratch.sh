#!/bin/bash


#echo "Adding custom aliases"
./installing_aliases.sh
source ~/.bashrc

echo "Moving to home folder"
cd ~
pwd

DIST_CODE_NAME=$(lsb_release -cs) #$(echo $(lsb_release -c) | cut -d " " -f 2)

echo "Requiring su access to download, install and update programs"
sudo apt-get update > /dev/null
	
echo "Installing usefull packages with apt-get..."
sudo apt-get install git python2.7 python2.7-dev python-pip pinta gimp inkscape -y > /dev/null
sudo apt-get install libboost-dev libboost-filesystem-dev -y > /dev/null
pip install --upgrade pip > /dev/null;

echo "Downloading and installing Spotify..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y


echo "Downloading and installing Docker"
sudo apt-get -y install apt-transport-https ca-certificates curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get -y install docker-ce

echo "Installing VLC player and OpenShot video editor"
sudo apt-get install vlc openshot -y

echo "Downloading and Installing Atom Editor"
wget -O atom_deb https://atom.io/download/deb
sudo dpkg -i atom_deb
rm atom_deb

echo "Downloading and installing Pycharm"
sudo add-apt-repository ppa:mystic-mirage/pycharm
sudo apt-get update
sudo apt-install pycharm-community

