#! /bin/bash

print_usage(){
  cat<<USAGE_TAG
USAGE: ${0} <base-image-location> <new-image-location> [SIZE]
USAGE_TAG
}

if [[ $# -lt 2 ]];
then
  exec 1>&2
  cat<<ERROR_TAG
ERROR: the location of image and location of base image is required.
ERROR_TAG
  print_usage
  exit 1
fi;

if [[ ! -f ${1} ]];
then
  cat<<ERROR_TAG
Error: file $1 does not exist
ERROR_TAG
  print_usage
  exit 2
fi;

qemu-img create -f qcow2 -b $1 -F qcow2 $2 ${3:-}
