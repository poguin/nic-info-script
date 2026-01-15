#!/bin/bash

echo "=== Network Info ==="

IF=$(ip route | awk '/default/ {print $5; exit}')

echo "Interface: $IF"

echo "IP:"
ip -4 addr show "$IF" | awk '/inet /{print $2}'

echo "MAC:"
cat /sys/class/net/$IF/address

echo "Gateway:"
ip route | awk '/default/ {print $3}'

echo "DNS:"
grep nameserver /etc/resolv.conf | awk '{print $2}'

echo "Link speed:"
ethtool "$IF" 2>/dev/null | awk -F': ' '/Speed/ {print $2}'

echo "DHCP:"
nmcli -g DHCP4 device show "$IF" 2>/dev/null || echo "unknown"

