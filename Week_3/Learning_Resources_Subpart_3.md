# Subpart-3

# LQR Controller

This video is probably the best explanation of the LQR controller on the internet. Give it a watch.

## 🚀 Introduction to LQR Control

LQR is a smart way of choosing the feedback control law:

$$
u = -Kx
$$

Instead of randomly guessing the values of K, LQR calculates the **best possible values** of the gain K that balance two goals:

1. **Keep the system stable and near the target**
2. **Don't use too much input**

---

## 📊 The Optimization Problem

LQR minimizes a **cost** — a number that tells you how well you're doing. The cost is:

$$
J = \int_0^\infty (x^T Q x + u^T R u) \, dt
$$

Where:

- x = how far the system is from the goal
- u = control input

> You pick Q and R (costs), and LQR finds the best K that minimizes the total cost.
> 
1. The Q matrix is a diagonal matrix of nxn which contains the cost of each variable of the state. The higher the cost, the quickly the system needs to converge to that particular variable.
2. The R matrix is a 1xz matrix where z is the number of actuators in the system. It decides how much cost is associated with each actuator. The higher the cost of an actuator, the lest power it must use.

For example, let’s say we have the following system-

![Inverted Pendulum](./img/inverted_pendulum_sys.png)

The Q and R matrices would look something like -

![Q Matrix](./img/q_matrix.png)

![R Matrix](./img/r_matrix.png)

What LQR does is it tries to produce a K matrix such that this J cost is minimum. This is an optimization problem and it’s mathematics can’t be covered here but modern control libraries in python and MATLAB can give you the K matrix with a single command, given you know values of A, B, Q and R.

**K = lqr(A, B, Q, R)**

Once we place the value of K into the dynamics, we get an optimal converging system which we can control and converge to any point that we like.

Try the Bonus Task

Well, that’s all from our side for this week. Now you can also attempt the second task of the week. Best of Luck!!

![Meme](https://prod-files-secure.s3.us-west-2.amazonaws.com/38308a69-41aa-485a-998e-b0dfab760099/daba3cfa-d402-4122-8062-0435fe04eae6/assetsmeme4.jpg)

## Now the general question that may arise is:
Why LQR if we already have PID?

The application of industrial robots has greatly increased in recent years making production systems more and more efficient. With this in mind, increasingly efficient controllers are needed for those robots.

![Industrial Robot](./img/industrial_robot.png)

LQR control is a trade-off between highly optimized controls and reduced complexity such as in PID control.

LQR controllers are robust and produce a very low steady state error, However there are sometimes huge transition delays when working with multiple feedback gains, making them non-ideal to apply on fast response systems or those with no direct access to all states. On the other hand, a PID controller gives a faster response but not with robust gains as the previous controller.

Also you can a give a read to this Research paper(just give a overview reading to understand it better)

Therefore, which controller to use depends upon the system and operating conditions as well.

![Controller choice](./img/controller_choice.png)

## Further Readings - Extras

1. Here is a great playlist on basics of control that covers all that has taken place in this camp and more in great detail. Watch this if you are really interested in controls and want to become a controls expert :)

---

## **NEXT** ⏩
*Now that you've mastered the fundamentals of Control Systems, Mathematical Modeling, PID, LQR, and State-Space representations, you are completely ready to put it all into practice!*

👉 **[Next: Proceed to Task 3.2 - LQR Controller Assessment](./Task_3.2.md)**
