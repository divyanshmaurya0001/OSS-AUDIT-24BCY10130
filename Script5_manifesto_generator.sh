#!/bin/bash
# ============================================================
# Script: Open Source Statement Creator
# Author: Divyansh Maurya
# Description: Takes user input and generates a personal
#              open-source philosophy file
# ============================================================

echo "=============================================="
echo "     OPEN SOURCE STATEMENT BUILDER"
echo "=============================================="
echo ""

# --- Function for input (avoids repeated while loops) ---
get_input() {
    prompt=$1
    value=""

    while [[ -z "$value" ]]; do
        read -p "$prompt" value
        [[ -z "$value" ]] && echo "Please don't leave it blank."
    done

    echo "$value"
}

# --- Collect inputs ---
tool=$(get_input "Tool you use daily: ")
meaning=$(get_input "Freedom (one word): ")
creation=$(get_input "Something you'd build: ")

echo ""
echo "Creating your statement..."
sleep 1

# --- File setup ---
user_name=$(whoami)
file_name="oss_note_${user_name}.txt"
timestamp=$(date "+%d-%m-%Y %H:%M")

# --- Generate content in one block instead of multiple echoes ---
cat <<EOF > "$file_name"
==============================================
        PERSONAL OPEN SOURCE NOTE
==============================================

Generated on : $timestamp
User         : $user_name

----------------------------------------------

Using $tool daily reminds me that software is built on shared effort.
The idea of "$meaning" drives the open-source world — giving users
control, transparency, and the ability to learn.

Open systems are not just about code availability.
They represent trust, collaboration, and continuous improvement.

If I ever create $creation, I would release it openly.
Not for recognition, but to contribute back to the same ecosystem
that made my work possible.

----------------------------------------------
Selected Software: MySQL
Course: OSS NGMC
==============================================
EOF

# --- Display result ---
echo ""
echo "----------- GENERATED OUTPUT -----------"
cat "$file_name"

echo ""
echo "----------------------------------------"
echo "Saved as: $file_name"
echo "Size    : $(stat -c%s "$file_name") bytes"
echo "----------------------------------------"
