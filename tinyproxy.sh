#!/bin/bash
wget https://github.com/tinyproxy/tinyproxy/releases/download/1.11.1/tinyproxy-1.11.1.tar.gz
tar -zxvf tinyproxy-1.11.1.tar.gz -C ~
~/tinyproxy-1.11.1/autogen.sh
~/tinyproxy-1.11.1/configure
/usr/bin/make ~/tinyproxy-1.11.1/ && /usr/bin/make ~/tinyproxy-1.11.1/install
cd /usr/local && sudo mkdir -p var
cd var && sudo mkdir log
cd log && sudo mkdir tinyproxy
/bin/rm -f /usr/local/etc/tinyproxy/tinyproxy.conf
/usr/bin/wget --no-check-certificate -O /usr/local/etc/tinyproxy/tinyproxy.conf https://raw.githubusercontent.com/TheLuckyVince/bash/main/tinyproxy.conf
/sbin/iptables -I INPUT -p tcp --dport 8000 -j ACCEPT
/sbin/iptables-save
service tinyproxy restart
systemctl enable tinyproxy
