#!/bin/bash

echo
while [ -n "$1" ]
do
case "$1" in
--all)
ip address;
ifconfig;
ip route;
 ;;
--target) netstat -antp | grep tcp ;;
*) echo "$1 there is two keys - "--all" or "--target"" ;;
esac
shift
done
exit 1;
