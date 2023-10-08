#!/bin/sh

set -x


# Create the tap devices
ip tuntap add mode tap name ktap1
ip tuntap add mode tap name ktap2
ip tuntap add mode tap name ktap3


# Bring up the tap devices
ip link set ktap1 up
ip link set ktap2 up
ip link set ktap3 up


# Create the bridge to link the tap devices
ip link add name kbr0 type bridge
ip link set dev ktap1 master kbr0
ip link set dev ktap2 master kbr0
ip link set dev ktap3 master kbr0


# Bring up the bridge
ip link set kbr0 up
