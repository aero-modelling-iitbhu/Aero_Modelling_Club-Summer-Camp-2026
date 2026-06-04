# Fusion-360 Installation Guide

# Fusion 360

A comprehensive Notion page template to guide installation of Autodesk Fusion 360 on Windows, macOS, and Ubuntu 22.04.

---

## 📋 Overview

This page covers:

- System requirements
- Prerequisites
- Download links
- Installation steps
- Troubleshooting tips
- Educational Access

---

## 🖥️ Windows

### 1. System Requirements

- **OS:** Windows 10 or 11 (64-bit)
- **RAM:** 4 GB (8 GB+ recommended)
- **GPU:** DirectX 11–capable with 1 GB+ VRAM
- **Storage:** 3 GB free

### 2. Prerequisites

- Microsoft Visual C++ 2015–2019 Redistributable (x64)
- .NET Framework 4.7.2 or later

### 3. Download Installer

1. Go to Autodesk Account: manage.autodesk.com
2. Under **All Products & Services**, find **Fusion 360**
3. Click **Download** → Select **Windows**

### 4. Installation

1. Run the downloaded `.exe`
2. Accept the EULA and follow prompts
3. Wait for all components to download and install

### 5. First Launch & Update

1. Open **Fusion 360**
2. Sign in with your Autodesk ID
3. Allow automatic update check and install

---

### 🍎 macOS (It is recommended to install it on MAC and do other work on UTM)

### 1. System Requirements

- **OS:** macOS 10.15 (Catalina) or later
- **RAM:** 4 GB (8 GB+ recommended)
- **GPU:** Metal-capable with 1 GB+ VRAM
- **Storage:** 3 GB free

### 2. Download DMG

1. In Autodesk Account, locate **Fusion 360**
2. Click **Download for Mac**

### 3. Installation

1. Double-click the `.dmg` to mount
2. Drag **Fusion 360.app** into **Applications**

### 4. First Launch & Update

1. Open **Applications > Fusion 360**
2. Sign in and allow updates

---

## 🐧 Ubuntu 22.04 (Community Workarounds)

Fusion 360 is not natively supported on Linux. Below are two community-supported methods.

### A. Cryinkfly Wine Installer Script

1. **Install Wine & dependencies**
    
    ```bash
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install wine64 wine32 winetricks cabextract yad
    ```
    
2. **Run Installer Script**
    
    ```bash
    curl -L https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/setup/autodesk_fusion_installer_x86-64.sh \
      -o install_fusion360.sh && chmod +x install_fusion360.sh && \
    ./install_fusion360.sh --install --default
    ```
    
    - Add `-full` for all extensions
    - Uninstall via `-uninstall`
3. **Launch**
    - Run `fusion360` from your app menu

### B. Snap Package (Edge Channel)

1. **Ensure snapd**
    
    ```bash
    sudo apt update
    sudo apt install snapd
    ```
    
2. **Install Snap**
    
    ```bash
    sudo snap install fusion360 --edge
    ```
    
3. **Launch**
    - Run `fusion360` from your app launcher

> Note: Known issues with Snap include floating toolbars and exit hangs.

---

## 🛠️ Troubleshooting & Tips

- **GPU Drivers:** Install latest proprietary drivers (NVIDIA/AMD).
- **Winetricks Tweaks:** For login issues under Wine:
    
    ```bash
    winetricks dotnet48 corefonts
    ```
    
- **Performance:** Allocate more RAM or use dedicated GPU under Wine.
- **Updates:** Rerun the installer script or snap refresh for latest builds.

---

<aside>
💡

***Apply for Autodesk Fusion 360's Educational Access to unlock even more features! While your application is being reviewed, you can still explore the software's core functionalities. Fusion 360 - Educational Access***

</aside>

---

# SolidWorks & Ansys Links

Link to download solidworks and ansys:
- [Link 1](https://iitbhuacin-my.sharepoint.com/:f:/g/personal/aryan_kumar_mec21_iitbhu_ac_in/Ep6X02My5qBElme6-oiZU1cBbAmdY0HwXmRvq2fQCty0lQ?e=voDTzG)
- [Link 2 (How to download)](https://iitbhuacin-my.sharepoint.com/:v:/g/personal/raut_sahilprakash_mec23_iitbhu_ac_in/EUwY-9khU49Cn9lo58aDW-8BOCovOxdN8bpj5V0Rg2az0g?e=OgcENc&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D)
