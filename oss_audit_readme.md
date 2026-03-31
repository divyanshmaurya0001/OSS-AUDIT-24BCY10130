# OSS Audit Project — MySQL

**Capstone Submission for Open Source Software (OSS NGMC)**

---

## 📌 Project Details

| Field | Information |
|------|------------|
| **Student Name** | Divyansh Maurya |
| **Registration No.** | 24BCY10130 |
| **University** | VIT Bhopal University |
| **Selected Software** | MySQL |
| **License Type** | GPL v2 (Community) / Commercial (Enterprise) |
| **Course** | Open Source Software (OSS NGMC) |

---

## 📖 Overview

This repository contains five Bash scripts created as part of an open-source audit project.

MySQL was selected due to its importance in the evolution of web technologies. Since its introduction in the 1990s, it has been widely used as a reliable and fast relational database system. It became a key component of the LAMP stack and continues to be relevant in modern applications. MySQL follows a dual licensing approach, offering both open-source and commercial usage options.

---

## 📂 Project Structure

oss-audit-24BCY10130/
├── README.md
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh

---

## ⚙️ Script Descriptions

### 🔹 Script 1: System Identity Report
Displays system-related information such as OS version, kernel details, logged-in user, uptime, and current date/time.

---

### 🔹 Script 2: Package Inspector
Checks if a package (e.g., MySQL) is installed and retrieves version and license details using system package managers.

---

### 🔹 Script 3: Disk and Permission Auditor
Analyzes system directories and reports permissions, ownership, and disk usage.

---

### 🔹 Script 4: Log Analyzer
Reads log files, counts keyword occurrences (default: "error"), and shows recent matching entries.

---

### 🔹 Script 5: Manifesto Generator
Collects user input and generates a simple open-source philosophy statement saved as a text file.

---

## 🚀 How to Run

### Prerequisites
- Linux OS
- Bash shell
- Optional: MySQL installed

### Setup

git clone https://github.com/YOUR-REPO-LINK.git
cd oss-audit-24BCY10130
chmod +x *.sh

### Run Scripts

./script1_system_identity.sh
./script2_package_inspector.sh mysql-server
./script3_disk_auditor.sh
./script4_log_analyzer.sh /path/to/logfile error
./script5_manifesto_generator.sh

---

## 📦 Dependencies

- bash
- uname, whoami, date
- dpkg / rpm
- ls, du, df
- grep, wc, tail

---

## 👨‍💻 Author

Divyansh Maurya  
VIT Bhopal University  
2026
