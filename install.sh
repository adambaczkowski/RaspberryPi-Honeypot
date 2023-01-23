#!/bin/bash
sudo apt-get -y install psad msmtp msmtp-mta python-twisted iptables-persistent libnotify-bin fwsnort raspberrypi-kernel-headers
###update vars in configuration files
#sed -i "s/xhostnamex/$sneakyname/g" psad.conf
#sed -i "s/xemailx/$emailaddy/g" psad.conf
	@@ -52,4 +25,3 @@ cp honeypot.py /root/honeypot
(crontab -l 2>/dev/null; echo "@reboot python /root/honeypot/honeypot.py &") | crontab -
python /root/honeypot/honeypot.py &
ifconfig
