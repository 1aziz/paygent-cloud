#!/bin/bash

# Public IP address
IP="{EXPOSED_IP}"

# Name to associate with public IP address
DNSNAME="paygent"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
