#!/bin/bash
# ============================================================
# Script: Log Scanner Utility
# Author: Divyansh Maurya
# Description: Searches a log file for a keyword and shows stats
# ============================================================

file_path=$1
search_term=${2:-error}

echo "=============================================="
echo "         LOG SCANNER TOOL"
echo "=============================================="
echo ""

# --- Basic validation (compressed, less textbook style) ---
if [[ -z "$file_path" ]]; then
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

if [[ ! -f "$file_path" ]]; then
    echo "File not found: $file_path"
    exit 1
fi

if [[ ! -r "$file_path" ]]; then
    echo "Permission denied. Try: sudo $0 $file_path $search_term"
    exit 1
fi

if [[ ! -s "$file_path" ]]; then
    echo "File is empty. Nothing to scan."
    exit 0
fi

echo "File     : $file_path"
echo "Keyword  : $search_term"
echo ""

# --- Faster approach: no manual loop (major difference) ---
total_lines=$(wc -l < "$file_path")
match_count=$(grep -i -c "$search_term" "$file_path")

echo "--------------[ SUMMARY ]----------------"
echo "Total Lines   : $total_lines"
echo "Matches Found : $match_count"

# --- Percentage calculation ---
if (( total_lines > 0 )); then
    percent=$(( match_count * 100 / total_lines ))
    echo "Match Ratio   : ${percent}%"
fi

echo ""

# --- Show recent matches (more efficient pipeline) ---
if (( match_count > 0 )); then
    echo "----------[ RECENT MATCHES ]-------------"
    grep -i "$search_term" "$file_path" | tail -n 5 | sed 's/^/>> /'
else
    echo "No matching entries found."
fi

echo ""
echo "=============================================="
echo "Scan complete → '$search_term' appeared $match_count times"
echo "=============================================="
