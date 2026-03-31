# OSS Audit Project — MySQL

**Capstone Submission for Open Source Software (OSS NGMC)**

---

##  Project Details

| Field | Information |
|------|------------|
| **Student Name** | Divyansh Maurya |
| **Registration No.** | 24BCY10130 |
| **University** | VIT Bhopal University |
| **Selected Software** | MySQL |
| **License Type** | GPL v2 (Community) / Commercial (Enterprise) |
| **Course** | Open Source Software (OSS NGMC) |

---

##  Overview

This repository contains five Bash scripts created as part of an open-source audit project.

MySQL was selected because it serves as a fundamental database system for web technology development. The system has functioned as a dependable and high-speed relational database system since its 1990s debut. It became a key component of the LAMP stack and continues to be relevant in modern applications. MySQL follows a dual licensing approach which allows users to choose between open-source and commercial usage options.

---

##  Project Structure

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

The system identity report displays system information which includes OS version and kernel details and the currently logged-in user and system uptime and current date and time. 

---

### 🔹 Script 2: Package Inspector

The package inspector verifies the installation status of a package which includes MySQL and it retrieves both version information and license details through system package management tools.

---

### 🔹 Script 3: Disk and Permission Auditor

The system directories undergo analysis which results in the generation of reports that display their permissions and ownership details along with the measurements of disk space they consume.

---

### 🔹 Script 4: Log Analyzer

The log analyzer tool processes log files to determine the frequency of keywords which appears with an initial setting of "error" and it presents the latest entries that meet the search criteria.

---

### 🔹 Script 5: Manifesto Generator
Collects user input and generates a simple open-source philosophy statement saved as a text file.

---

##  How to Run

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

## Dependencies

- bash
- uname, whoami, date
- dpkg / rpm
- ls, du, df
- grep, wc, tail

---

##  Author

Divyansh Maurya  
VIT Bhopal University  
2026
