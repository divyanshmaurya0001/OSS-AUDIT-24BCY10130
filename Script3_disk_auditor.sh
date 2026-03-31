#!/bin/bash
# ============================================================
# Script: Storage & Access Review Tool
# Author: Divyansh Maurya
# Description: Examines key directories, shows ownership,
#              permissions, and space usage including MySQL paths
# ============================================================

echo "=================================================="
echo "        STORAGE & PERMISSION CHECK"
echo "=================================================="
echo ""

echo "Run Time  : $(date)"
echo "Machine   : $(hostname)"
echo ""

# --- Directories grouped logically instead of separate blocks ---
common_dirs="/etc /var/log /home /usr/bin /tmp /var/lib /usr/sbin"
mysql_dirs="/etc/mysql /var/lib/mysql /var/log/mysql /run/mysqld"

# --- Function to analyze a directory ---
inspect_dir() {
    path=$1

    if [[ -d "$path" ]]; then
        info=$(stat -c "%A %U %G" "$path" 2>/dev/null)
        usage=$(du -sh "$path" 2>/dev/null | awk '{print $1}')
        printf "%-28s | %-20s | %-8s\n" "$path" "$info" "${usage:---}"
    else
        printf "%-28s | %-20s\n" "$path" "Not Available"
    fi
}

echo "------------------[ SYSTEM PATHS ]------------------"
printf "%-28s | %-20s | %-8s\n" "Directory" "Permissions/Owner" "Size"
echo "---------------------------------------------------"

# --- Loop using space-separated string instead of array ---
for d in $common_dirs; do
    inspect_dir "$d"
done

echo ""
echo "------------------[ MYSQL PATHS ]-------------------"
printf "%-28s | %-20s | %-8s\n" "Directory" "Permissions/Owner" "Size"
echo "---------------------------------------------------"

for d in $mysql_dirs; do
    inspect_dir "$d"
done

echo ""
echo "------------------[ CONFIG FILES ]------------------"

config_files="/etc/mysql/my.cnf /etc/my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf"

for file in $config_files; do
    if [[ -f "$file" ]]; then
        details=$(stat -c "%A %U %G" "$file")
        echo "Found: $file"
        echo "       $details"
    fi
done

echo ""
echo "------------------[ DISK STATUS ]-------------------"

# Alternative approach using df + awk differently
df -h / | awk 'NR==2 {
    print "Root Filesystem (/)"
    print "Total Space   : " $2
    print "Used Space    : " $3
    print "Free Space    : " $4
    print "Usage Percent : " $5
}'

echo ""
echo "=================================================="
echo "Scan finished."
echo "=================================================="
