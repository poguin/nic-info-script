#!/bin/bash

echo "===== TINKLO INFORMACIJA ====="
echo ""

echo "► IP adresai:"
ip addr show
echo ""

echo "► Maršrutizavimo lentelė:"
ip route show
echo ""

echo "► DNS serveriai:"
cat /etc/resolv.conf
echo ""

echo "► Aktyvūs tinklo ryšiai:"
ss -tulpn
echo ""

echo "► Tinklo sąsajos:"
nmcli device status 2>/dev/null || echo "nmcli nepasiekiamas"
