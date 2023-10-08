#!/bin/sh
set -x

# Bring down the bridge
ip link set kbr0 down


# Delete the bridge
ip link del kbr0


# Delete the tap devices
ip tuntap del mode tap dev ktap1
ip tuntap del mode tap dev ktap2
ip tuntap del mode tap dev ktap3
