#!/bin/bash
# ============================================================
# Script: Package Checker & Info Viewer
# Author: Divyansh Maurya
# Description: Verifies installation status of a package and
#              displays basic details along with a short note
# ============================================================

# --- Input Handling ---
pkg_name=${1:-mysql-server}

echo "=================================================="
echo "        PACKAGE CHECK TOOL"
echo "=================================================="
echo "Target Package : $pkg_name"
echo ""

# --- Identify available package manager dynamically ---
manager=""

type dpkg &>/dev/null && manager="dpkg"
type rpm &>/dev/null && [ -z "$manager" ] && manager="rpm"

if [ -z "$manager" ]; then
    echo "No supported package manager detected."
    exit 1
fi

echo "Using Manager  : $manager"
echo ""

# --- Function to display details (clean separation of logic) ---
show_dpkg_info() {
    dpkg -s "$pkg_name" 2>/dev/null | awk -F': ' '
        /Version|Status|Maintainer|Homepage/ {
            printf "  %-12s : %s\n", $1, $2
        }'
}

show_rpm_info() {
    rpm -qi "$pkg_name" 2>/dev/null | awk -F': ' '
        /Version|License|Summary|URL/ {
            printf "  %-12s : %s\n", $1, $2
        }'
}

# --- Check installation ---
installed="no"

if [ "$manager" = "dpkg" ]; then
    dpkg -s "$pkg_name" &>/dev/null && installed="yes"
else
    rpm -q "$pkg_name" &>/dev/null && installed="yes"
fi

# --- Output result ---
if [ "$installed" = "yes" ]; then
    echo "[✔] Package is present on system"
    echo ""
    echo "---- Details ----"

    if [ "$manager" = "dpkg" ]; then
        show_dpkg_info
    else
        show_rpm_info
    fi
else
    echo "[✘] Package not found"
    echo ""
    echo "Try installing it using:"
    echo "  Debian/Ubuntu : sudo apt install $pkg_name"
    echo "  RHEL/CentOS   : sudo dnf install $pkg_name"
fi

echo ""
echo "--------------------------------------------------"
echo "            QUICK OPEN-SOURCE NOTE"
echo "--------------------------------------------------"

# --- Compact case logic with different phrasing ---
case "$pkg_name" in
    mysql* )
        echo "MySQL changed how web apps handled data."
        echo "From blogs to large platforms, it powered the early internet."
        echo "License: GPL v2 + Commercial option"
        ;;
    apache*|httpd )
        echo "Apache helped shape the modern web."
        echo "It was the backbone of early websites."
        echo "License: Apache 2.0"
        ;;
    mariadb* )
        echo "MariaDB continues MySQL’s legacy under full open governance."
        echo "It prioritizes community over corporate control."
        echo "License: GPL v2"
        ;;
    firefox )
        echo "Firefox stands for user privacy and open standards."
        echo "Developed by a non-profit, not a tech giant."
        echo "License: MPL 2.0"
        ;;
    git )
        echo "Git revolutionized collaboration in coding."
        echo "Now it's impossible to imagine development without it."
        echo "License: GPL v2"
        ;;
    python* )
        echo "Python grew because it’s simple and flexible."
        echo "Used everywhere — from scripts to AI."
        echo "License: PSF License"
        ;;
    * )
        echo "Every open-source tool represents shared effort."
        echo "Understanding its license is as important as using it."
        ;;
esac

echo ""
echo "=================================================="
echo "Check completed for: $pkg_name"
echo "=================================================="
