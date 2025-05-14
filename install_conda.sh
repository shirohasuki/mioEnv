#!/bin/bash

PREFIX=~/anaconda
anaconda_version="Anaconda3-2024.10-1-Linux-x86_64.sh"

zsh

echo "Create folder !"
if [ -d $PREFIX ]; then
    #rm -rf $PREFIX/*
    echo "Install to $PREFIX !"
else
    mkdir -p $PREFIX
fi

cd $PREFIX

echo "Downloading files !"
if [ ! -d "$PREFIX/$anaconda_version" ]; then
	echo "Begin to download $anaconda_version !"
	wget https://repo.anaconda.com/archive/$anaconda_version
	echo "Download completed !"
fi

echo "Start install Anaconda!"
source ~/.zshrc
chmod +x $anaconda_version
./$anaconda_version
echo "Install completed!"

echo "Application environment variables !"
source ~/.zshrc


read -r -p "Whether to delete the installation package? [y/n | yes/no] : " input
case $input in
    [yY][eE][sS]|[yY])
	echo "Delete the installation package !"
	cd ../
	rm -rf $PREFIX
	;;

    [nN][oO]|[nN])
	echo "Keep the installation package !"
       	;;

    *)
	echo "Input error, skip execution !"
	;;
esac

echo "Finish !!!"

echo "The current python environment is :"
which python

