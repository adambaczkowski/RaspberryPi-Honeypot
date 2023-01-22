# HoneyPi

It is astonishingly easy as an attacker to move around on most networks undetected. Let's face it, unless your organization is big enough to have full packet capture with some expensive IDS, you will likely have no idea if there is an attacker on your network. What are the options for home users and small businesses? 

## What if there were a cheap Raspberry Pi device you could plug into your network that masquerades as a juicy target to hackers? 

HoneyPi attempts to offer a reliable indicator of compromise with little to no setup or maintenance costs. There are tons of honeypot options out there, but we leveraged our experience in penetration testing to answer the question *What sorts of activities could be flagged that we generally do when attacking an internal network?*

That is why HoneyPi tries to keep it simple compared to other honeypots. HoneyPi only flags a few surefire triggers that would catch most attackers snooping around on an internal network:
 1. Port Scanning Activities
 2. FTP Connection Attempts
 3. Telnet Connection Attempts
 4. VNC Connection Attempts

Wrap up this simplicity in a way that is designed to be deployed on a RaspberryPi and you've got a simple honeypot that you can add to your network to get insight when you are under attack.

## Installation

You'll need a Raspberry Pi running Rasbian.

From the Pi, do this:
 1. git clone https://github.com/adambaczkowski/RaspberryPi-Honeypot
 2. cd https://github.com/adambaczkowski/RaspberryPi-Honeypot
 3. chmod +x *.sh
 4. sudo ./install.sh
