#! /bin/bash


sudo bash scripts/ifup.sh


# Start deb1(Bridge/Router)
qemu-system-x86_64 -enable-kvm -name “DEB1_gateway” \
  -m 1024 -hda deb1.qcow2 -smp 2 \
  -device e1000,netdev=userbr \
	-netdev user,id=userbr \
  -device e1000,mac=de:ad:be:ef:00:01,netdev=tap1 \
	-netdev tap,id=tap1,ifname=ktap1,script=no,downscript=no &


sleep 5


# Start deb2(Host 1)
qemu-system-x86_64 -enable-kvm -name “DEB2” \
  -m 1024 -hda deb2.qcow2 -smp 2 \
  -device e1000,mac=de:ad:be:ef:00:02,netdev=tap2 \
	-netdev tap,id=tap2,ifname=ktap2,script=no,downscript=no &


sleep 5


# Start deb3(Host 2)
qemu-system-x86_64 -enable-kvm -m 1024 -name “DEB3” \
  -hda deb3.qcow2 -smp 2 \
  -device e1000,mac=de:ad:be:ef:00:03,netdev=tap3 \
	-netdev tap,id=tap3,ifname=ktap3,script=no,downscript=no


sudo bash scripts/ifdown.sh
