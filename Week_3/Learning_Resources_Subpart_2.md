# Subpart-2

# Understanding Proportional Integral Derivative (PID) Controller

![PID Controller](./img/pid.png)

**NOTE:** Make sure you have covered the Control Systems document of subpart 1 before proceeding further.

## Introduction

In case you do not want to do the reading stuffs, here’s a self explananatory video to ease you out :)
[PID Controller Explained](https://www.youtube.com/watch?v=wkfEZmsQqiA)

- **Proportional-integral-derivative** (PID) controllers are **widely used** in industrial systems despite the significant developments of recent years in control theory and technology.

![PID Diagram](https://pbs.twimg.com/media/ENZi_ZeUwAAko5A?format=jpg&name=medium)

- PID is an example of a **closed loop system**.
- They **perform well** for a wide class of processes.
- Also, they give **robust performance** for a wide range of operating conditions and, they are easy to implement using analogue or digital hardware.
- PID is perhaps the most important,popular and simplistic **feed back controller**,out there.The significance of which could be done justice only by the videos below and *not even us !!*
- Refer this video by **Aerospace Controls Laboratory of Massachusetts Institute of Technology (MIT)**.
- A brief introduction of PID by Brian Douglas. [Video](https://www.youtube.com/watch?v=UR0hOmjaHp0)

> NOTE:
> 
> - Try watching the videos again to understand as much as possible. It has a lot of important information.
> - After you think you have some background about PID start reading below.

To put things in perspective, we will have to go through some definitions.

---

## Terminology

The basic terminology that one would require to understand PID are:

**Error:** The error is the amount at which a device isn’t doing something right. For example, suppose the robot is located at x=5 but it should be at x=7, then the error is 2.

**Proportional (P):** The proportional term is directly proportional to the error at present.

**Integral (I):** The integral term depends on the cumulative error made over a period of time (t).

**Derivative (D):** The derivative term depends on rate of change of error.

**P-Factor (Kp):** A constant value used to increase or decrease the impact of Proportional

**I-Factor (Ki):** A constant value used to increase or decrease the impact of Integral

**D-Factor (Kd):** A constant value used to increase or decrease the impact of Derivative

## Variations of PID controllers

### 1. Proportional Controller aka P Controller

- Proportional controller is mostly used **in first order processes** with single energy storage **to stabilize the unstable process**.
- The main usage of the P controller is to **decrease the steady state error** of the system.
> **Note:** Steady State error refers to the error comparing with the desired value that the system produces after achieving a steady state or more appropriately the error from the actual desired value showed by the system after a long period of time when output is more or less stabilised.
- As the **proportional gain factor K** increases, the **steady state error** of the system **decreases**.
- However, despite the reduction, **P control can never** manage to **eliminate** the **steady state error** of the system.
- As we **increase the proportional gain**, it provides **smaller amplitude** and **phase margin**, **faster dynamics** satisfying wider frequency band and **larger sensitivity** to the noise.
- We can **use** this controller **only** when our **system is tolerable** to a **constant steady state error**.
- In addition, it can be easily concluded that applying **P controller decreases** the **rise time**.
- Moreover, **after** certain value of **reduction on the steady state error**, **increasing K** only **leads to overshoot** of the system response.
- P control also **causes oscillation if sufficiently aggressive** in the presence of lags and/or dead time.
    
    > Small reading task: Learn about dead time in control systems.
    
- The more lags (higher order), the more problem it leads. Plus, it directly **amplifies process noise**.
- A P controller consists of only a linear gain Kp. The output of such controller can be simply given as
    
    ```bash
    output = Kp * error
    ```
    

### 2. Proportional-Derivative Controller aka PD Controller

- A controller which **changes the input** of the controller to **proportional plus derivative of error signal** is called **PD** controller.
- It is used to **damp the oscillations** that arise because of increasing the proportional constant.
    
    ```bash
    output = (Kp * error) + (Kd * ((error - previous error)/Δt))
    where, Δt is a small duration of time
    ```
    

### 3. Proportional-Integral-Derivative Controller aka PID Controller

- A controller which **changes the input** of the controller to **proportional plus derivative of error signal plus the integral of the error** is called **PID** controller.
- It is used to **remove the steady state error** which might arise in PD controller.

```bash
sum err = sum err + error
output = (Kp * error) + (Kd * ((error - previous error)/Δt)) + (Ki * sum err * Δt)
```

More mathematically PID is represented as

# output =

![PID Equation](https://www.scilab.org/sites/default/files/eq1_0.PNG)

- Wanna C PID,..here it’s in action..
    1. Single motor target tracking.
    2. Self-balancing PID-ball tracker

## References

1. The series of videos by **MATLAB** will help to grasp the concept of PID in the best way possible. You can watch the entire playlist from here.
2. This document by **National Programme on Technology Enhanced Learning** will help you get some great insights about PID.
3. You can read more about pid in the **blog by brettbeauregard**.

---


---
## **NEXT** ⏩
👉 **[Next: Proceed to Subpart 3 - LQR Controller](./Learning_Resources_Subpart_3.md)**
