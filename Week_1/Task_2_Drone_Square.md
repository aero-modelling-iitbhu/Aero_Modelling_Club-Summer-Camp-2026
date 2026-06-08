# 🚁 Task 2: Launching the Drone & Square Mission

## **Task Description**

Welcome to your first real drone challenge! In this task, you will launch the simulated PX4 drone using Gazebo and QGroundControl, and configure an autonomous mission.

### 1. Launch the Simulator
First, you must launch your simulated drone in any Gazebo world of your choice. Refer to the [Launch Drone Guide](./Launch_Drone.md) we covered earlier if you need a refresher on the commands!
- Run `make px4_sitl gz_x500` (or choose a custom world).
- Launch the Micro XRCE-DDS Agent.
- Connect your drone to QGroundControl.

### 2. Autonomous Square Mission
Once connected to QGroundControl, your goal is to design an autonomous flight plan (Mission) that makes the drone fly in a perfect **Square** pattern.

**Mission Requirements:**
1. The drone must **Takeoff**.
2. Navigate to four separate waypoints to trace out a clear square pattern in the sky.
3. The final command of the mission must be **Return to Launch (RTL)**, where the drone autonomously returns to its takeoff location and lands.

---

## 📥 Submit Your Work

1. Create a folder named `<YourName>_Task-2` with your `.plan` file and demonstration video inside.
2. Compress the folder into a `.zip`.
3. Upload the `.zip` file to **Google Drive** and set the sharing permissions to **"Anyone with the link can view"**.
4. Submit your Google Drive link to the form below:

📝 **[Task 2 Submission Form](https://docs.google.com/forms/d/e/1FAIpQLSezIPEt6opqRVapC7WIbiLZ58H238SR70iUL20SDn6ckOwWoQ/viewform?usp=publish-editor)**

---
⬅️ **[Back: Task 1 - ROS 2 Basics](./Task_1_ROS2_Basics.md)** | ➡️ **[Next: Task 3 - TurtleBot3 Navigation](./Task_3_TurtleBot3_Square.md)**
