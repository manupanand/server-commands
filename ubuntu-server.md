# CEH Tools Complete README (With Installation Commands)

This document contains a comprehensive list of CEH (Certified Ethical Hacker) tools categorized by:

* ✔ Reconnaissance
* ✔ Vulnerability Scanning
* ✔ Password Attacks
* ✔ Web App Exploitation
* ✔ Wireless Hacking
* ✔ Reverse Engineering
* ✔ Malware Analysis
* ✔ OSINT Tools

Each tool now includes **install commands for Ubuntu**.

---

## 🕵️‍♂️ 1. Reconnaissance Tools

**Used for information gathering, footprinting, and scanning.**

### ● Nmap

```
sudo apt install -y nmap
```

### ● Hping3

```
sudo apt install -y hping3
```

### ● Netdiscover

```
sudo apt install -y netdiscover
```

### ● Masscan

```
sudo apt install -y masscan
```

### ● TheHarvester

```
sudo apt install -y theharvester
```

### ● Recon-ng

```
sudo apt install -y recon-ng
```

### ● WhatWeb

```
sudo apt install -y whatweb
```

### ● Wappalyzer CLI

```
npm install -g wappalyzer
```

### ● Sublist3r

```
sudo apt install -y sublist3r
```

### ● Amass

```
sudo snap install amass
```

### ● DNSenum

```
sudo apt install -y dnsenum
```

### ● DNSrecon

```
sudo apt install -y dnsrecon
```

---

## 🛡 2. Vulnerability Scanning Tools

### ● Nikto

```
sudo apt install -y nikto
```

### ● OpenVAS (Greenbone)

```
sudo apt install -y openvas
sudo gvm-setup
sudo gvm-check-setup
```

### ● SQLMap

```
sudo apt install -y sqlmap
```

### ● Skipfish

```
sudo apt install -y skipfish
```

### ● Arachni

Arachni is discontinued but installable:

```
wget https://github.com/Arachni/arachni/releases/download/.../arachni.tar.gz
```

### ● WPScan

```
sudo apt install -y wpscan
```

### ● OWASP ZAP

```
sudo snap install zaproxy --classic
```

---

## 🔐 3. Password Attack Tools

### ● Hydra

```
sudo apt install -y hydra
```

### ● Medusa

```
sudo apt install -y medusa
```

### ● John the Ripper

```
sudo apt install -y john
```

### ● Hashcat

```
sudo apt install -y hashcat
```

### ● Crunch

```
sudo apt install -y crunch
```

### ● CeWL

```
sudo apt install -y cewl
```

### ● Responder

```
sudo apt install -y responder
```

### ● Kerbrute

```
wget https://github.com/ropnop/kerbrute/releases/latest/download/kerbrute_linux_amd64
chmod +x kerbrute_linux_amd64
```

---

## 🌐 4. Web Application Exploitation Tools

### ● BurpSuite

```
sudo apt install -y burpsuite
```

### ● OWASP ZAP

```
sudo snap install zaproxy --classic
```

### ● Dirb

```
sudo apt install -y dirb
```

### ● Gobuster

```
sudo apt install -y gobuster
```

### ● FFUF

```
sudo apt install -y ffuf
```

### ● XSStrike

```
git clone https://github.com/s0md3v/XSStrike
cd XSStrike
pip install -r requirements.txt
```

### ● Commix

```
sudo apt install -y commix
```

### ● BeEF

```
sudo apt install -y beef-xss
```

---

## 📡 5. Wireless Hacking Tools

### ● Aircrack-ng Suite

```
sudo apt install -y aircrack-ng
```

### ● Reaver

```
sudo apt install -y reaver
```

### ● Wifite

```
sudo apt install -y wifite
```

### ● Kismet

```
sudo apt install -y kismet
```

### ● Wifiphisher

```
sudo apt install -y wifiphisher
```

### ● Bettercap

```
sudo apt install -y bettercap
```

---

## 🔧 6. Reverse Engineering Tools

### ● Ghidra

```
wget https://ghidra-sre.org/ghidra_*.zip
unzip ghidra_*.zip
```

### ● Radare2

```
sudo apt install -y radare2
```

### ● Cutter

```
sudo snap install cutter --classic
```

### ● GDB

```
sudo apt install -y gdb
```

### ● Apktool

```
sudo apt install -y apktool
```

### ● JD-GUI

```
sudo snap install jd-gui
```

### ● Frida

```
pip install frida-tools
```

---

## 🧫 7. Malware Analysis Tools

### ● Cuckoo Sandbox

```
sudo apt install -y cuckoo
```

### ● YARA

```
sudo apt install -y yara
```

### ● ClamAV

```
sudo apt install -y clamav clamav-daemon
```

### ● Volatility

```
sudo apt install -y volatility
```

### ● PEStudio (Windows)

Run via Wine:

```
sudo apt install -y wine
```

---

## 🌍 8. OSINT Tools

### ● Maltego

```
wget https://maltego-downloads.s3.us-east-2.amazonaws.com/Maltego.vX.X.X.deb
sudo dpkg -i Maltego*.deb
```

### ● SpiderFoot

```
sudo apt install -y spiderfoot
```

### ● Sherlock

```
git clone https://github.com/sherlock-project/sherlock
cd sherlock
pip install -r requirements.txt
```

### ● Holehe

```
pip install holehe
```

### ● OSINT Framework (web)

No install — web-based.

---

## 📦 Optional: Full Kali Tools on Ubuntu

### Install Katoolin3

```
git clone https://github.com/s-h-3-l-l/katoolin3
cd katoolin3
sudo python3 setup.py install
sudo katoolin3
```

---

## ✔ This README now contains:

* Full CEH toolset
* Installation commands
* Organized categories

If you want, I can add:

* Usage examples for every tool
* A full CEH practical lab setup
* A version optimized for GitHub README
* A PDF or DOCX export
