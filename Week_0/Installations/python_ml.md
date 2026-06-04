# Python 3 and ML Libraries Installation Guide

This guide covers the installation of Python 3, PyBullet, NumPy, and other essential libraries for model training and simulation.

---

## 1. Install Python 3 & pip

### For Ubuntu / Debian
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

### For Windows
1. Download the latest Python installer from the [official website](https://www.python.org/downloads/).
2. Run the installer. **Important:** Check the box that says "Add Python 3.x to PATH".
3. Verify installation in Command Prompt:
```cmd
python --version
pip --version
```

### For macOS
Using [Homebrew](https://brew.sh/):
```bash
brew install python
```

---

## 2. Set Up a Virtual Environment (Recommended)

It's best practice to use a virtual environment for your ML projects to avoid dependency conflicts.

```bash
# Create a virtual environment named "ml_env"
python3 -m venv ml_env

# Activate the virtual environment (Ubuntu/macOS)
source ml_env/bin/activate

# Activate the virtual environment (Windows)
ml_env\Scripts\activate
```

---

## 3. Install PyBullet, NumPy, and Other Libraries

With your virtual environment active, run the following `pip` commands:

### Essential Libraries for Physics Simulation & Math
```bash
pip install pybullet numpy scipy matplotlib
```

### Machine Learning Framework (PyTorch)
If you are doing Reinforcement Learning or Deep Learning, PyTorch is highly recommended.

**For CPUs or Macs:**
```bash
pip install torch torchvision torchaudio
```

**For GPUs (NVIDIA/CUDA on Windows/Linux):**
Please refer to the [PyTorch official installation page](https://pytorch.org/get-started/locally/) to get the correct command for your CUDA version. Example for CUDA 11.8:
```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

---

## 4. Verify Installation

Open a Python shell by typing `python` in your terminal and run:

```python
import numpy as np
import pybullet as p
import torch

print("NumPy version:", np.__version__)
print("PyBullet imported successfully!")
print("PyTorch version:", torch.__version__)
```

If no errors appear, your environment is fully set up for model training and simulations!
