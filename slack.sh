#!/bin/bash

cd /tmp
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.2-amd64.deb
sudo dpkg -i slack-desktop-*.*.*-amd64.deb
sudo rm -rf slack-desktop-*.*.*-amd64.deb
sudo apt-get -f install -y

APP_NAME=Slack
APP_EXEC="/usr/bin/slack --disable-gpu %U"
AUTOSTART_CONFIG=~/.config/autostart/$APP_NAME.desktop

sudo touch $AUTOSTART_CONFIG

sudo echo "[Desktop Entry]" >> $AUTOSTART_CONFIG
sudo echo "Type=Application" >> $AUTOSTART_CONFIG
sudo echo "Exec=$APP_EXEC" >> $AUTOSTART_CONFIG
sudo echo "Hidden=false" >> $AUTOSTART_CONFIG
sudo echo "NoDisplay=false" >> $AUTOSTART_CONFIG
sudo echo "X-GNOME-Autostart-enabled=true" >> $AUTOSTART_CONFIG
sudo echo "Name[en_US]=$APP_NAME" >> $AUTOSTART_CONFIG
sudo echo "Name=$APP_NAME" >> $AUTOSTART_CONFIG
sudo echo "Comment[en_US]=" >> $AUTOSTART_CONFIG
sudo echo "Comment=" >> $AUTOSTART_CONFIG
