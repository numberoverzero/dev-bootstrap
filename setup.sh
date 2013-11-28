#!/bin/sh

EMAIL=joe.mcross@gmail.com
VENV=~/.virtualenvs
PROJ=~/projects

# Install pip, virtualenvwrapper
cd ~
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python ez_setup.py
python get-pip.py
pip install virtualenvwrapper
rm ez_setup.py get-pip.py

# Install utilities
sudo add-apt-repository ppa:webupd8team/sublime-text-2 
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git xclip sublime-text emacs

# Load project/virtualenv path + traversal
touch ~/__init__.py
mkdir $PROJ
touch $PROJ/__init__.py
mkdir $VENV
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
echo "alias emacs=\"emacs -nw\"" >> .bashrc
source ~/.profile

# Generate ssh key for github
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -C "$EMAIL"
ssh-add id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Log into github account, add ssh key and paste key from clipboard"
