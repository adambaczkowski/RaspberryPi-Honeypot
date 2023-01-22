#!/bin/bash

#check root
if [ $UID -ne 0 ]
then
 echo "Please run this script as root"
 exit 1
fi

####Disclaimer!###
if whiptail --yesno "You're about to install Raspberry Pi IDS/honeypot. This install process will change some things: It will flush your iptables and turn up logging. Continue?" 20 60
then
  echo "continue"
else
  exit 1
fi

####Change password if you haven't yet###
if [ $SUDO_USER == 'pi' ]
then
 if whiptail --yesno "You're currently logged in as default pi user. If you haven't changed the default password 'raspberry' would you like to do it now?" 20 60
 then
  passwd
 fi
fi
####Install PSAD ###
whiptail --infobox "Installing a bunch of software like the log monitoring service and other dependencies...\n" 20 60
sudo apt-get -y install psad msmtp msmtp-mta python-twisted iptables-persistent libnotify-bin fwsnort raspberrypi-kernel-headers

###update vars in configuration files
#sed -i "s/xhostnamex/$sneakyname/g" psad.conf
#sed -i "s/xemailx/$emailaddy/g" psad.conf
#sed -i "s/xenablescriptx/$enablescript/g" psad.conf
#sed -i "s/xalertingmethodx/$alertingmethod/g" psad.conf
#sed -i "s=xexternalscriptx=$externalscript=g" psad.conf
#sed -i "s/xcheckx/$check/g" psad.conf

###Wrap up everything and exit
sudo mkdir /root/honeypot
sudo cp blink*.* /root/honeypot
sudo cp psad.conf /etc/psad/psad.conf
iptables --flush
iptables -A INPUT -p igmp -j DROP
#too many IGMP notifications. See if that prevents it
iptables -A INPUT -j LOG
iptables -A FORWARD -j LOG
service netfilter-persistent save
service netfilter-persistent restart
psad --sig-update
service psad restart
cp honeypot.py /root/honeypot
(crontab -l 2>/dev/null; echo "@reboot python /root/honeypot/honeypot.py &") | crontab -
python /root/honeypot/honeypot.py &
ifconfig

