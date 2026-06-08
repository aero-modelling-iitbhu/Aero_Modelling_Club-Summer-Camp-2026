# 🚀 Task 1: Launching Your First Simulated Drone

**Prerequisite:** Make sure you have completed the [Learning Resources](./Learning_Resources.md) guide before proceeding!

---

## 🛠️ 1. Building PX4 Autopilot

Before we can launch the drone, we need to build the PX4 Autopilot firmware. Open your terminal, navigate to your PX4-Autopilot directory, and run the following command to build the code:

```bash
cd ~/PX4-Autopilot
make px4_sitl
```

*(Note: If you are building PX4 packages within a ROS 2 workspace, you may also use `colcon build` to compile the packages).*

---

## 🚁 2. Launching the Drone in Gazebo

Now, let's launch our first drone! Run the following command in your terminal:

```bash
make px4_sitl gz_x500
```

### What does this command mean?
*   `make`: The build tool used to compile and execute the simulation targets.
*   `px4_sitl`: Tells the system to run the **S**oftware **I**n **T**he **L**oop (SITL) version of the PX4 autopilot firmware.
*   `gz_x500`: Specifies that we want to launch the **x500** quadcopter frame inside the **Gazebo (gz)** simulator.

---

## 🌍 3. Understanding Worlds & Launch Files

### What is a Launch File?
A launch file is a script that automatically configures and starts multiple nodes, parameters, and simulation environments all at once. This saves you from having to type dozens of terminal commands manually.

### What is a World File?
A **world file** defines the 3D environment inside the Gazebo simulator. It contains the physics, lighting, terrain, buildings, and other obstacles your drone will interact with.

You can find all the default world files inside the PX4 directory here:
📁 `PX4-Autopilot/Tools/simulation/gz/worlds`

### Launching a Custom World
You can easily spawn your drone into a different environment using environment variables. For example, to launch a drone equipped with a 2D LiDAR inside a forest environment, run:

```bash
PX4_GZ_WORLD=forest make px4_sitl gz_x500_lidar_2d
```

When you run this command, the Gazebo simulator will open up and it will look like this:

![Gazebo Forest World](./img/droneforest.png)

---

## 🔌 4. Connecting the Micro XRCE-DDS Agent

To allow your PX4 drone to communicate with ROS 2, you need to run the Micro XRCE-DDS Agent. Open a **new terminal window** and run the following commands:

```bash
cd ~/Micro-XRCE-DDS-Agent
MicroXRCEAgent udp4 -p 8888
```

This starts a UDP server on port 8888 that acts as a bridge between PX4 and ROS 2.

---

## 🌐 5. Ground Station Connection (QGroundControl)

Now that your simulated drone is flying in Gazebo, it's time to connect it to **QGroundControl (QGC)**.

### For Ubuntu / Native Linux Users:
1. Open QGroundControl.
2. The simulated drone communicates over UDP port `14550`. QGC should automatically detect the drone on `localhost` and connect.

### 🍎 For Mac Users (UTM Virtual Machine):
Because QGroundControl is running natively on your Mac but the simulation is running inside the UTM Ubuntu VM, you need to bridge the network.

Open a terminal on your **Mac** and run:
```bash
socat UDP-LISTEN:14550,fork,reuseaddr UDP:192.168.64.1:14550
```
*(Ensure `192.168.64.1` matches your UTM VM's bridge IP).* 

Then, open QGroundControl on your Mac. Go to **Application Settings -> Comm Links -> Add**. 
Create a new UDP link and set the IP to your UTM IP address to connect to the drone.

![QGroundControl Connection](./img/Qground.png)

---

## 🗺️ 6. Creating a Surveying Mission in QGC

Let's tell the drone to autonomously map out an area!

1. **Open the Plan View:** Click the "Plan" button (the map pin icon) in the top-left corner of QGroundControl.
2. **Takeoff Command:** First, click the map to add a standard `Takeoff` waypoint.
3. **Add a Survey Pattern:** Click the **Pattern** tool on the left side of the screen and select **Survey**.
4. **Draw the Polygon:** A green polygon will appear on the map. Click and drag the corners to cover the area you want the drone to survey.
5. **Adjust Settings:** On the right-hand panel, you can adjust the drone's altitude, camera spacing, and flight speed.
6. **Upload Mission:** Click the **Upload Required** button in the top right to send the flight plan directly to the simulated drone.
7. **Fly:** Switch back to the "Fly" view, arm the drone, and slide to confirm mission execution!
You can watch the video below for any doubts.

---

### 📹 Mission Walkthrough Video

👉 **[Watch the Output Video Here](https://drive.google.com/file/d/1wj2By4m3M-D56KDJy6_eH8JLNnGRJtcs/view?usp=drive_link)**

---
⬅️ **[Back to Learning Resources](./Learning_Resources.md)**
