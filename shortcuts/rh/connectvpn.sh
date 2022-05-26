#!/bin/bash

if command -v netExtender &> /dev/null
then
netExtender 64.89.105.130:4433 -u warnesp -d localdomain
elif [ -f /opt/forticlient/vpn ] ;
then
sudo /opt/forticlient/vpn --server=https://arl-gateway.axientcorp.com:443/jira-users --user=warnesp --password
else
    echo "No VPN found"
fi


