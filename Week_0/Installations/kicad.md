# KiCAD Installation Guide

A comprehensive Notion template to install KiCAD on Windows, macOS, and Ubuntu 22.04.

---

## 📋 Overview

This page covers:

- System requirements for each platform
- Download links and installation steps
- Post-installation setup
- Troubleshooting tips

---

# 🛠️ KiCAD Installation

## 1. System Requirements

- **OS**: Windows 10/11 (64-bit), macOS 10.14+, Ubuntu 22.04
- **RAM**: 2 GB (4 GB+ recommended)
- **Disk**: 1 GB free

## 2. Windows

### a. Download Installer

1. Go to kicad.org
2. Choose the 64‑bit installer `.exe`

### b. Install

1. Run the downloaded `.exe`
2. Follow the wizard: accept licenses, choose install path, select optional libraries
3. Finish and launch KiCAD

## 3. macOS

### a. Download DMG

1. Visit kicad.org/download/macos/
2. Download the `.dmg`

### b. Install

1. Open the `.dmg`
2. Drag **KiCAD.app** to **Applications**
3. Eject the image and launch KiCAD from Launchpad

## 4. Ubuntu 22.04

### a. Add PPA & Install

```bash
sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
sudo apt update
sudo apt install kicad pcb kicad-library
```

### b. Launch

- From Applications menu or via `kicad` command
