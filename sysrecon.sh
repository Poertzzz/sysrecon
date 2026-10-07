#!/bin/bash
# sysrecon.sh - ringkasan sustem utuk enumerasi awal
OUT="recon_$(hostname)_$(date +%d%m%Y_%H%M).txt"

section() { echo -e "\n===== $1 ======";}

{ 
        section "IDENTITAS"
        echo "User      : $(whoami)"
        echo "Host      : $(hostname)"
        echo "Kernel    : $(uname -r)"
        
	section "Resource"
	echo "Ram	:"
	free -h
	echo "Disk	:"
	df -h /
	
	section "User dengan Login Shell"
	grep '/usr/bin/zsh' /etc/passwd | cut -d: -f1
	
	section "Jaringan"
	echo "IPv4 Wifi	: $(ip -br a | grep wlan0 | awk '{print $3}')"
	echo "IPv4 LAN	: $(ip -br a | grep eth0 | awk '{print $3}')"
	echo "Gateway	: $(ip route | awk 'NR==1{print $3}')"
	echo "DNS	: $(cat /etc/resolv.conf | awk 'NR==2{print $2}')"
	
	section "Port Listening"
	echo "LISTENING PORT : "
	ss -tulnp
	
	section "File SUID"
	echo "SUID :"
	find / -xdev -perm -4000 -type f 2>/dev/null
} > "$OUT" 2>&1

echo "[+] Laporan disimpan di $OUT"
