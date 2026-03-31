#!/bin/bash
# =====================================================================
# Script: System Overview Display
# Author: Divyansh Maurya
# Description: Prints system, user, and environment details in a styled format
# =====================================================================

# --- Basic Info ---
name="Divyansh Maurya"
reg="24BCY10130"
software="MySQL"

# --- Fetch system data using inline commands instead of pre-grouping ---
kernel_version=$(uname -r)
cpu_type=$(uname -m)
current_user=$(whoami)
home_path=$HOME
system_host=$(hostname)

# --- Date & Time ---
today=$(date +"%d-%m-%Y")
day_name=$(date +"%A")
time_now=$(date +"%T")
system_uptime=$(uptime -p)

# --- OS Detection (alternative parsing method) ---
if [[ -e /etc/os-release ]]; then
    os_name=$(awk -F= '/PRETTY_NAME/ {print $2}' /etc/os-release | tr -d '"')
else
    os_name="Not Detected"
fi

# --- Licence Info ---
linux_license="GPL v2"
mysql_license="GPL v2 (Community) / Commercial (Enterprise)"

# --- Output Section ---
clear
echo "************************************************************"
echo "            SYSTEM OVERVIEW DASHBOARD"
echo "************************************************************"
echo ""

printf "%-18s : %s\n" "Student Name" "$name"
printf "%-18s : %s\n" "Registration No" "$reg"
printf "%-18s : %s\n" "Selected Software" "$software"

echo ""
echo "------------------[ MACHINE DETAILS ]-----------------------"

printf "%-18s : %s\n" "Hostname" "$system_host"
printf "%-18s : %s\n" "OS" "$os_name"
printf "%-18s : %s\n" "Kernel" "$kernel_version"
printf "%-18s : %s\n" "CPU Architecture" "$cpu_type"

echo ""
echo "-------------------[ USER DETAILS ]-------------------------"

printf "%-18s : %s\n" "User" "$current_user"
printf "%-18s : %s\n" "Home Path" "$home_path"

echo ""
echo "--------------------[ TIME INFO ]---------------------------"

printf "%-18s : %s\n" "Day" "$day_name"
printf "%-18s : %s\n" "Date" "$today"
printf "%-18s : %s\n" "Time" "$time_now"
printf "%-18s : %s\n" "Uptime" "$system_uptime"

echo ""
echo "--------------------[ LICENSING ]---------------------------"

echo "Linux Kernel License  : $linux_license"
echo "MySQL License        : $mysql_license"

echo ""
echo "************************************************************"
echo "   Freedom in software means control, not restriction."
echo "************************************************************"
