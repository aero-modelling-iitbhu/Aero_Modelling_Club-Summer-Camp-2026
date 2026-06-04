# ROS2 Installation Guide 🚀

The ultimate guide to setting up your ROS 2 development environment for awesome simulations!
This guide will help you to:
- Dual Boot your System.
- Install ROS 2 quickly and painlessly.
- Jumpstart your robotics project.

## System Requirements 🛠️
- Ubuntu 22.04 (Jammy)
- At least 4GB RAM (8GB recommended for simulations)
- 50GB+ free disk space
- Stable internet connection

## DUAL BOOT or VM BOX Installation
Pro Tip: Dual boot = real robotics work!
Warning: Backup your data before dual booting!

### Option 1: Dual Boot (Windows)
🔹 Better performance (full hardware access)
🔹 Recommended for serious ROS development
[Complete Dual Boot Guide](https://ubuntu.com/tutorials/install-ubuntu-desktop)
🎥 **Video Tutorial (Windows):** [Watch here](https://youtu.be/mXyN1aJYefc?si=IY9qCfughXljzpg3)

### Option 2: Virtual Machine (Windows/Mac)
🔹 Safer for beginners (no partitioning)
🔹 Easy to delete if something goes wrong
[Virtual Machine Setup Guide](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox)

🍏 **For Mac Users (UTM Setup):**
You can download UTM to easily run an Ubuntu Virtual Machine on your Mac.
🎥 **Video Tutorial (Mac UTM):** [Watch here](https://youtu.be/JrNS3brSnmA?si=Gw_35CDk0hw8YS71)

You need to install Ubuntu 22.04 only.
- This ISO file [LINK](https://ubuntu.com/download/desktop/arm64) is for 64-bit ARM (ARMv8/AArch64) architecture (Apple Silicon Macs).
- This ISO file [LINK](https://ubuntu.com/download/desktop) is for AMD64 or EM64T architecture (Windows / Intel Macs).

---

## Quick Installation of ROS2

### ROS 2 Humble Hawksbill (Installation Guide):
Installation Guide for ROS 2
Installation Steps (Simply copy and paste each command into the terminal. To paste, use Ctrl + Shift + V):

#### For Windows

**1. Open Terminal in Ubuntu & Set Locale:**
```bash
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings
```

**2. Setup Sources:**
```bash
sudo apt install software-properties-common
sudo add-apt-repository universe
```

Add ROS 2 GPG key with apt:
```bash
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
```

Add the ROS 2 repository:
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```

**3. Install ROS 2 packages:**
```bash
sudo apt update
sudo apt upgrade
sudo apt install ros-humble-desktop
```

**4. Install Gazebo for ROS 2:**
```bash
sudo apt install ros-humble-gazebo-ros
```

**5. Environment Setup:**
```bash
source /opt/ros/humble/setup.bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

Open the terminal and write the following command:
```bash
sudo apt install python3-colcon-common-extensions
```

**Check Installation:**
Open terminal 1:
```bash
ros2 run demo_nodes_cpp talker
```

Open terminal 2:
```bash
ros2 run demo_nodes_py listener
```

Setup complete!

---

#### For Mac User:
**Initial System Setup**
```bash
# Update system
sudo apt update
sudo apt upgrade -y

# Install required dependencies
sudo apt install -y software-properties-common build-essential cmake git curl wget gnupg lsb-release
```

---

## Installation Guide for ROS 2 Humble and Gazebo Harmonic on Ubuntu 22.04 (ARM)

This guide provides step-by-step instructions to install ROS 2 Humble and Gazebo Harmonic on an ARM-based Ubuntu 22.04 system, including environment setup and optimizations for ARM architecture.

### 1. ROS 2 Humble Installation

**Set Locale**
```bash
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
```

**Add ROS 2 Repository**
```bash
sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```

**Install ROS 2 Humble**
```bash
sudo apt update
sudo apt install -y ros-humble-desktop
```

**Setup ROS 2 Environment**
```bash
echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
source ~/.bashrc
```

**Install Development Tools**
```bash
sudo apt install -y ros-dev-tools python3-colcon-common-extensions python3-rosdep python3-pip
sudo rosdep init
rosdep update
```

### 2. Gazebo Harmonic Installation

**Add Gazebo Repository**
```bash
sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
```

**Install Gazebo Harmonic**
```bash
sudo apt update
sudo apt install -y gz-harmonic
```

**Environment Setup for ARM**
```bash
echo 'export LIBGL_ALWAYS_SOFTWARE=1' >> ~/.bashrc
echo 'export MESA_GL_VERSION_OVERRIDE=3.3' >> ~/.bashrc
echo 'export OGRE_RTT_MODE=Copy' >> ~/.bashrc
source ~/.bashrc
```

### 3. ROS 2 - Gazebo Integration

**Install Integration Packages**
```bash
sudo apt update
sudo apt install -y ros-humble-ros-gz-bridge ros-humble-ros-gz-sim ros-humble-ros-gz-interfaces
```

**Create a Workspace**
```bash
mkdir -p ~/ros_gz_ws/src
cd ~/ros_gz_ws/src
```

**Clone Integration Packages**
```bash
# Environment variables to optimize compilation on ARM
export ASAN_OPTIONS=detect_leaks=0
export CCACHE_SLOPPINESS=pch_defines,time_macros
export CCACHE_COMPRESS=1
export CCACHE_MAXSIZE=5G

# Build with single thread to avoid memory issues
MAKEFLAGS="-j1" colcon build --symlink-install --packages-select ros_gz_bridge --cmake-args -DCMAKE_CXX_FLAGS="-O1"

# Build other packages
colcon build --symlink-install --packages-skip ros_gz_bridge
```

**Source the Workspace**
```bash
echo 'source ~/ros_gz_ws/install/setup.bash' >> ~/.bashrc
source ~/.bashrc
```

**Check Installation:**
Open terminal 1:
```bash
ros2 run demo_nodes_cpp talker
```

Open terminal 2:
```bash
ros2 run demo_nodes_py listener
```

Setup complete!
