#!/bin/sh

##Disable NAT
iptables -t nat -D UBIOS_POSTROUTING_USER_HOOK 2
iptables -t nat -D UBIOS_POSTROUTING_USER_HOOK 1
iptables -t nat -L POSTROUTING

iptables -t nat -I POSTROUTING 1 -o eth8 -j ACCEPT











router bgp 65001
 bgp router-id 172.16.220.254
 neighbor 172.16.220.253 remote-as 65000
 !
 address-family ipv4 unicast
  redistribute kernel
  redistribute connected
  neighbor 172.16.220.253 default-originate
 exit-address-family
exit