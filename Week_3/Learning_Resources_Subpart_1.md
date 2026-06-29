# 📚 Learning Resources: Controls & Dynamics

# Subpart-1

## What is Robot Control?

- In simple words, its the connection between **limbs(mechanics)** of the bot to its **brain(software)**.
- In technical terms - A system that can command, direct or regulate itself or another system to achieve a certain goal.

## Before diving in, here are some terms

- **System**: A combination or arrangement of a number of different physical components to form a whole unit such that that combining unit performs to achieve a certain goal.
- **Plant or process**: The part or component of a system that is required to be controlled.
- **Input**: It is the signal or excitation supplied to a control system.
- **Output**: It is the actual response obtained from the control system.
- **Disturbances**: The signal that has adverse effect on the performance of a control
system.
- Basically, there are two types of systems
    - **Open loop systems**
        - A control system in which the control action is totally independent of the output of the system.
        - Manually controlled systems are also categorized as open loop systems.
        - Such systems can been seen as in microwaves, washing machines etc., where we set the timer and that action takes place for that certain amount of time.
        
        
        
    - **Closed loop Systems**
        - A control system in which the control action adjusts itself according to the output generated to achieve a certain objective.
        - The difference between open loop system and closed loop system is the **feedback** closed loop system takes from the output.
        - The feedback gives an idea about the output which is then compared with the **desired action**. the deviation in output w.r.t to desired value is **error**. The controller tries to minimize this error.
        - Such systems can be seen all around us, some are present in electric irons, geysers to maintain a fixed temperature and many more!!
        
        

## 📘 **Mathematical Modelling**

This is the first step in designing any control system. Before we can apply any controller — whether it's a PID or a more advanced technique — we need to understand how the system behaves in response to inputs. **Mathematical modeling** helps us do exactly that. It is the process of deriving the equations that describe how a system evolves over time based on the physical laws governing it.

**But why do we need to model a system mathematically in the first place?**

> Imagine you're driving a car. If you press the accelerator, the car doesn’t instantly reach top speed — it gradually picks up. If you're steering around a curve, how sharply you turn the wheel affects how the car responds. To drive safely and smoothly, you subconsciously predict how the car will react to your inputs based on your past experience.

In control systems, we need to do the same — but using math. Whether it’s a robot arm trying to reach a point or a motor rotating to a precise angle, we need to **predict how the system will respond to control inputs**. And to do that, we first need to understand the underlying physics — captured through a mathematical model. This lets us design control strategies that are stable, responsive, and accurate.

To build a model, we start by looking at the system’s **dynamics** — the forces, torques, or electrical effects acting on it. Then, we apply basic physical laws like **Newton’s second law** (for mechanical systems) or **Kirchhoff’s laws** (for electrical circuits) to relate input and output variables using **differential equations**.

---

### **Okay, so… What does the mathematical model look like?**

Once we’ve derived the physical equations that describe how the system behaves — like Newton’s second law for a mechanical system — the next step is to express those equations in a form that's suitable for **applying control strategies**. For most real-world systems, this means writing the model as a **system of first-order differential equations**.

Why first-order?

Because most control techniques (like PID tuning, linearization, or modern control methods) work on systems written in this specific form:

```
ẋ₁ = f₁(t, x₁, x₂, ..., xₙ, u₁, u₂, ..., uₚ)
ẋ₂ = f₂(t, x₁, x₂, ..., xₙ, u₁, u₂, ..., uₚ)  
⋮
ẋₙ = fₙ(t, x₁, x₂, ..., xₙ, u₁, u₂, ..., uₚ)               ... (Eqn. A)
```

Here’s what the terms mean:

- x₁, x₂, …, xₙ are the **state variables** — quantities that define the system's current condition (like position, velocity, angle, etc.).
- ẋᵢ (read as “x-dot”) is the **rate of change** of each state variable — how fast it's changing over time.
- u₁, u₂, ..., uₚ are the **inputs** — the things we control (like voltage to a motor, force applied, or torque).
- Each function fᵢ defines how one part of the system evolves based on the current states and inputs.

---

**Linear vs. Nonlinear Systems:**

Now that we’ve written our system in the general form:

ẋ₁ = f₁(t, x₁, x₂, ..., xₙ, u₁, u₂, ..., uₚ)

we can define whether the system is **linear or nonlinear** by looking at the **functions** fᵢ on the right-hand side. 

A system is **linear** if **each** fᵢ is a **linear function** of the states and inputs. This means:

- No terms like  x₁·x₂, x₁², or sin(x₁)
- Each state or input appears by itself, multiplied only by constants or functions of time

Or in other words, linear systems can be expressed as



Where, A is a **NxN square matrix** representing the dynamics of the system. And x is the **Nx1 state vector** representing the current state of the system.

However, Non-linear problems are of interest to engineers, biologists, mathematicians etc because most systems that occur in nature are inherently non-linear.
Non-linear dynamical systems that describe changes in variable over time may often appear chaotic, unpredictable or counter-intuitive in nature, contrasting with much simpler linear systems.

---

### How to form equations for a system?



There are two main ways to do this in classical mechanics:

---

### 1. **Newton’s Laws Method (NLM)**

This is the most intuitive and commonly taught method. It’s based on **Newton’s Second Law**:

$$
F = ma
$$

where F is Force, m is Mass, and a is Acceleration

In the case of rotational motion, we use the rotational analog:

$$
τ = Iα
$$

where τ is Torque, I is Moment of Inertia, and α is Angular Acceleration

### 🧮 How it works:

- Identify all the **forces** (or torques) acting on the system
- Apply Newton's equations (F=ma for linear motion or τ=Iα for rotational motion) in each direction
- Solve these equations to find acceleration, velocity, and other motion parameters

### ✅ Pros:

- Very **visual and intuitive**, especially for simple systems (blocks, pendulums, masses, etc.)
- Great for **translational and rotational systems** with fewer degrees of freedom

### ❌ Cons:

- Gets messy and hard to manage when the system has **multiple degrees of freedom**, constraints, or complex linkages

---

### 2. **Euler-Lagrange Method**

This is a more elegant, energy-based method that comes from **Lagrangian mechanics**. Instead of using forces, it uses **energies**:

$$
𝓛 = T - V
$$

Where:

- 𝓛 is the **Lagrangian**
- T is the **kinetic energy** of the system
- V is the **potential energy**

Then, for each generalized coordinate qᵢ, we use the **Euler-Lagrange equation**:

$$
\frac{d}{dt}\left(\frac{\partial \mathcal{L}}{\partial \dot{q}_i}\right) - \frac{\partial \mathcal{L}}{\partial q_i} = Q_i
$$

Where Qᵢ is the generalized non-conservative force (like friction or external input) corresponding to qᵢ.

### 🧮 How it works:

- Choose **generalized coordinates** (like angles, lengths, positions)
- Write expressions for **kinetic** and **potential** energy
- Plug into the Euler-Lagrange equation to get equations of motion

### ✅ Pros:

- Powerful for systems with **multiple degrees of freedom**, constraints, and complex motion (e.g. robotic arms, pendulums on carts)
- Doesn’t require drawing free body diagrams
- Automatically handles coupled motion (like in a double pendulum)

### ❌ Cons:

- Requires a bit more **mathematical maturity** (partial derivatives, generalized coordinates)
- Doesn’t directly give you force values unless you post-process

---

Okay, enough theory… Now lets go and actually derive these mathematical models for few example systems.

Well, only few systems follow Linear characteristics, few others can be approximated on some conditions.

We’ll get to those, first we look at one simple linear system - the spring and mass system



*Brings back memories…eh?*

The state equation for this system can be easily derived using Newton’s Laws, but with increasing complexity of the system, use of Lagrangian is preferred as it gives the dynamics eqn. with relative ease. Refer here.

Either way we arrive at the eqn.



Note that here x represents the displacement of mass from the normal position.

Now comes the part of choosing the state variables, remember the form in which we want our final equations to look like.. (Eqn. A)

So, taking x and ẋ as the states (i.e. x₁=x and x₂=ẋ), it can be seen that the equations can be expressed as

$$
\frac{d}{dt}(x)=\dot{x}
$$

$$
\frac{d}{dt}(\dot{x})=-\frac{k}{m}x
$$

(OR)

$$
\frac{d}{dt}(x_1)=x_2
$$

$$
\frac{d}{dt}(x_2)=-\frac{k}{m}x_1
$$

hence, the equations can be written as, and as you can see.. this is a linear system.



*(Linear equation for a spring mass system)*

---

Now, lets move on to a simple non-linear system… that of a simple pendulum.



Deriving its equations of motion is pretty straightforward… As given below

### 1) Newton's Method (NLM)

- The mass moves in a circular arc → use rotational form:

$$
τ = Iα = I\ddot{\theta}
$$

- Torque due to gravity:

$$
τ = -mgl\sin\theta
$$

- Moment of inertia about pivot:

$$
I = ml^2
$$

Combining equations:

$$
-mgl\sin\theta = ml^2\ddot{\theta}
$$

$$
\ddot{\theta} + \frac{g}{l}\sin\theta = 0
$$

---

### 2) Euler-Lagrange Method

- Kinetic energy:

$$
T = \frac{1}{2}ml^2\dot{\theta}^2
$$

- Potential energy:

$$
V = -mgl\cos\theta
$$

- Lagrangian:

$$
\mathcal{L} = T - V
$$

Using Euler-Lagrange equation:

$$
\frac{d}{dt}\left(\frac{\partial \mathcal{L}}{\partial \dot{\theta}}\right) - \frac{\partial \mathcal{L}}{\partial \theta} = 0
$$

$$
ml^2\ddot{\theta} + mgl\sin\theta = 0
$$

✅ Final equation:

$$
\ddot{\theta} + \frac{g}{l}\sin\theta = 0
$$

Now, we have to express these equations in the form of Eqn A.

Define state variables:

$$
x_1 = \theta
$$

$$
x_2 = \dot{\theta}
$$

Then:

$$
\dot{x}_1 = x_2
$$

$$
\dot{x}_2 = -\frac{g}{l}\sin(x_1)
$$

As you can see… the second equation is clearly non-linear and it cannot be expressed in the form of 

$$
\dot{X} = AX
$$

---

**Now, What happens if there is any external force acting on the system?**



### 1) Newton's Method (Rotational Dynamics)

Net torque:

$$
\tau_{\text{net}} = \tau_{\text{gravity}} + \tau_{\text{ext}} = -mgl \sin\theta + \tau_{\text{ext}}
$$

Moment of inertia about the pivot:

$$
I = ml^2
$$

Apply τ = Iθ̈:

$$
ml^2 \ddot{\theta} = -mgl \sin\theta + \tau_{\text{ext}}
$$

✅ Final Equation:

$$
\ddot{\theta} = -\frac{g}{l} \sin\theta + \frac{1}{ml^2}\tau_{\text{ext}}
$$

---

### 2) Euler-Lagrange Method

1. **Kinetic Energy**:

$$
T = \frac{1}{2}ml^2\dot{\theta}^2
$$

2. **Potential Energy**:

$$
V = -mgl \cos\theta
$$

3. **Lagrangian**:

$$
\mathcal{L} = T - V = \frac{1}{2}ml^2\dot{\theta}^2 + mgl \cos\theta
$$

4. **External Generalized Force**:
- Since τₑₓₜ is torque directly applied to θ, the Euler-Lagrange equation is modified such that it enters as an external input on the RHS.

Apply Euler-Lagrange:

$$
\frac{d}{dt} \left( \frac{\partial \mathcal{L}}{\partial \dot{\theta}} \right) - \frac{\partial \mathcal{L}}{\partial \theta} = \tau_{\text{ext}}
$$

$$
ml^2 \ddot{\theta} + mgl \sin\theta = \tau_{\text{ext}}
$$

Remember, Any non-conservative force acting on the system (Since states chosen are angular position and velocity that’s why force should also be taken as angular force i.e. Torque. In case we use linear motions as in the first example then we’ll use external linear force on the right hand side.) appears on the right side of the Euler-Lagrange equation.

✅ Same Final Equation:

$$
\ddot{\theta} = -\frac{g}{l} \sin\theta + \frac{1}{ml^2}\tau_{\text{ext}}
$$

---

### 🔄 First-Order State Form

Let:

$$
x_1 = \theta
$$

$$
x_2 = \dot{\theta}
$$

Then:

$$
\dot{x}_1 = x_2
$$

$$
\dot{x}_2 = -\frac{g}{l} \sin(x_1) + \frac{1}{ml^2} \tau_{\text{ext}}
$$

Cool, so just remember that in the above equation we have an external input to the system in the form of τₑₓₜ… this is will come in use later.

---

Okay, now we need to express these equations in one last form before we start controlling the system. Just hold on for a little for while, it will be worth it when you can make your robots do this-



# Introduction to State Space Modelling

We had briefly covered State Variables and State Equations in previous Task. In this section we will further elaborate on that topic and discuss the various control techniques that are associated with that.

In control engineering, a state-space representation is a mathematical model of a physical system as a set of input, output and state variables related by first-order differential equations or difference equations. State variables are variables whose values evolve through time in a way that depends on the values they have at any given time and also depends on the externally imposed values of input variables. Output variables’ values depend on the values of the state variables.

The state space equations for a linear time invariant system (LTI) system can be given as follows:



Here

x(t)- State Vector (n x 1 matrix)

y(t)- Output Vector (p x 1 matrix)

u(t)- Input Vector (m x 1 matrix)

A - State (or system) matrix (n x n matrix)

B - Input matrix (n x m matrix)

C - Output Matrix (p x n matrix)

D - Feed-forward matrix (p x m matrix)

### 📦 What Are These State-Space Matrices?

You're already familiar with the equation:

$$
\dot{x} = Ax
$$

That's a system **without any external input** — like letting a pendulum swing on its own, or a spring-mass system vibrate after being pulled.

But in real-world systems, we usually want to **do something** — give an input to the system and **control its behavior (Like we did in the case of pendulum with an external torque)**.

That's where we extend the model to:

$$
\dot{x}(t) = Ax(t) + Bu(t)
$$

$$
y(t) = Cx(t) + Du(t)
$$

Let's decode what these terms **really mean**, in a simple way:

---

### 🤖 Think of a Robot Arm



- Let's decode what these terms **really mean**, in a simple way:
- The internal state (*x*(t)) — like its **position** and **velocity** at time t
- The **input** (*u*(t)) — the **voltage** you apply to move the motors/servos
- The **output** (*y*(t)) — what you actually care about (or what is physically measurable) — maybe just the position of the end effector

Now…

- **A** tells us how the system **behaves on its own** (like how inertia and gravity make the arm move)
- **B** tells us how your **input (u)** affects the state (how much a push or voltage changes speed/position)
- **C** says how the **internal state maps to output** (e.g., you only measure position, not velocity)
- **D** says if the **input directly affects the output**, without going through the system dynamics (this is usually zero in most physical systems.

---

So don't worry about the sudden jump — you're not doing anything new. You're just wrapping everything you already know (position, velocity, inputs, outputs) into a more powerful and general format!

---

Here’s an example to make things clear

## 🧱 Example: Spring-Mass System with External Force

Let’s consider the linear spring block system we had considered earlier, but now with an external force input (meaning u=F(t) (1 x 1 matrix) )
After converting into first order form, these are the equations for this system (try deriving it yourself)

- x1= x (position)
- x2= ẋ (velocity)

then,



and you can clearly see that they can be written like this-



> (You can verify the order of these respective matrices with the notations given in the definition above)
> 

Which is the state-space representation…

Now, with a little bit of thinking, you can realize that only **linear** systems can be represented in this form directly….

So the next obvious question is…

# What to do with non-linear systems?



Most Real world systems are quite complex making them hard to be represented in linear forms, so we use certain methods to model them like one.

Linear or non-linear, all systems have a relation between change of state and current state, let a non-linear system be as follows (f(x) is any non-linear function.



Now, the non-linear system can be linearized about certain fixed states given as



Here is an example…

Suppose these are the equations of your non linear system

$$
\dot{x}_1 = -x_1 + 2x_1^3 + x_2
$$

$$
\dot{x}_2 = -x_1 - x_2
$$

Or in vector form:

$$
\dot{x} = \begin{bmatrix}
f_1(x_1, x_2) \\
f_2(x_1, x_2)
\end{bmatrix}
=
\begin{bmatrix}
-x_1 + 2x_1^3 + x_2 \\
-x_1 - x_2
\end{bmatrix}
$$

Here is a detailed procedure of how you would linearize this system-

### ✅ Step 1: Find Equilibrium Points

At equilibrium, Ẋ=0

$$
\dot{x}_1 = 0, \quad \dot{x}_2 = 0
$$

From

$$
\dot{x}_2 = -x_1 - x_2 = 0 \Rightarrow x_2 = -x_1
$$

Substitute in ẋ₁:

$$
0 = -x_1 + 2x_1^3 - x_1 = -2x_1 + 2x_1^3 = 2x_1(x_1^2 - 1)
\Rightarrow x_1 = 0, \pm 1
$$

Then,

$$
x_2 = -x_1
$$

➡️ Equilibrium Points:

1. (0, 0)
2. (1, -1)
3. (-1, 1)

---

### ✅ Step 2: Compute Jacobian Matrix

> **🧠 What is the Jacobian Matrix?**
>
> The **Jacobian matrix** is a matrix of **partial derivatives**. For a vector-valued function
>
> $$
> f : \mathbb{R}^n \rightarrow \mathbb{R}^n
> $$
>
> , the Jacobian is:
>
> $$
> A = \frac{\partial f}{\partial x} =
> \begin{bmatrix}
> \frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & \cdots \\
> \frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & \cdots \\
> \vdots & \vdots & \ddots
> \end{bmatrix}
> $$
>
> This Jacobian tells us how small changes in the state vector *x* affect the time derivative
>
> $$
> \dot{x}
> $$
>
> — it's the core of the linearization process.

Let's calculate partial derivatives:

$$
f_1 = -x_1 + 2x_1^3 + x_2
$$

$$
f_2 = -x_1 - x_2
$$

So,

$$
\frac{\partial f_1}{\partial x_1} = -1 + 6x_1^2,\quad \frac{\partial f_1}{\partial x_2} = 1
$$

$$
\frac{\partial f_2}{\partial x_1} = -1,\quad \frac{\partial f_2}{\partial x_2} = -1
$$

Therefore, the Jacobian is:

$$
A(x_1, x_2) = \begin{bmatrix} -1 + 6x_1^2 & 1 \\ -1 & -1 \end{bmatrix}
$$

---

### ✅ Step 3: Evaluate Jacobian at Each Equilibrium

### 🔹 At (0, 0):

$$
A = \begin{bmatrix} -1 + 6(0)^2 & 1 \\ -1 & -1 \end{bmatrix} = \begin{bmatrix} -1 & 1 \\ -1 & -1 \end{bmatrix}
$$

Linearized system:

$$
\dot{x} = Ax \quad \text{where } A = \begin{bmatrix} -1 & 1 \\ -1 & -1 \end{bmatrix}
$$

---

### 🔹 At (1, -1):

$$
A = \begin{bmatrix} -1 + 6(1)^2 & 1 \\ -1 & -1 \end{bmatrix} = \begin{bmatrix} 5 & 1 \\ -1 & -1 \end{bmatrix}
$$

Linearized system:

$$
\dot{x} = Ax \quad \text{where } A = \begin{bmatrix} 5 & 1 \\ -1 & -1 \end{bmatrix}
$$

---

### 🔹 At (–1, 1):

$$
A = \begin{bmatrix} -1 + 6(-1)^2 & 1 \\ -1 & -1 \end{bmatrix} = \begin{bmatrix} 5 & 1 \\ -1 & -1 \end{bmatrix}
$$

Same as previous case.

Ok, now we have created a linear model for our non-linear system at its equilibrium points- but…

### 🧭 Why Are We Calculating the Jacobian?

So far, we’ve seen that real-world systems — like a pendulum or a drone — follow **nonlinear** equations. That means the system behaves differently depending on where it is.

But here’s the thing:

> We often care about what happens near an equilibrium point — like when the pendulum is just hanging straight down or balanced upright.
> 

Now, close to that point, the system behaves in a **predictable and smooth** way. And instead of dealing with the full complex nonlinear model, we can ask:

**“Can I approximate this system by a simpler, linear system near this point?”**

That’s where the **Jacobian** comes in.

---

Now, lets do this for a system with physical significance, the pendulum with an external torque input

We had earlier derived that, if

$$
x_1 = \theta
$$

$$
x_2 = \dot{\theta}
$$

Then:

$$
\dot{x}_1 = x_2
$$

$$
\dot{x}_2 = -\frac{g}{l} \sin(x_1) + \frac{1}{ml^2} \tau_{\text{ext}}
$$

Now, lets try to create a state space equation for this system 

We can apply the same linearization technique explained above.

1. **Find the equilibrium points.**
    
    If we set ẋ₁ = 0 and ẋ₂=0, we will find the equilibrium points of this system as (nπ,0) where n=0,±1,±2,… .From the physical descriptions of the pendulum, it is clear that there are only two equilibrium positions (0,0) and (π,0). The rest of equilibrium points are just repetitions based on number of full swings of the pendulum.
    
    The equilibrium point (0,0) will be when the pendulum bob is vertically downwards.
    
    The equilibrium point (π,0) will be when the pendulum bob is vertically upwards.
    
    Intuitively, we can guess that the system will be stable at equilibrium point (0,0) and unstable at equilibrium point (π,0). Let us see if our intuition is correct.
    
2. **Calculate the Jacobian of the system of equations.**
    
    The Jacobian J₁ for the A matrix of the state equation will be:
    
    
    
    Since our system has input, we also need to calculate Jacobian J₂ for the B matrix.
    
    J₂ will be:
    
3. **For each equilibrium point, substitute value of (x₁,x₂) in the Jacobian and calculate the A and B matrix.**
    
    The values of A matrix for each equilibrium point will be given as:
    
    
    
    The values of B matrix for all equilibrium points will be:
    
    
    
4. **Construct the state equation for each equilibrium point.**
    
    **At (0,0)**
    
    $$
    \dot{x} = \begin{bmatrix}
    0 & 1 \\
    -\frac{g}{l} & 0
    \end{bmatrix}x + \begin{bmatrix}
    0 \\
    \frac{1}{ml^2}
    \end{bmatrix}u
    $$
    

      **and At (π,0)**

$$
\begin{bmatrix}\dot{x}_1\\\dot{x}_2\end{bmatrix}=\begin{bmatrix}0 & 1\\\frac{g}{l} & 0\end{bmatrix}\begin{bmatrix}x_1-\pi\\x_2\end{bmatrix}+\begin{bmatrix}0\\\frac{1}{ml^2}\end{bmatrix}u
$$

Or if we define a new shifted state Or if we define a new shifted state x̃₁ = x₁ - π, it becomes:, it becomes:

$$
\begin{bmatrix}\dot{\tilde{x}}_1\\\dot{x}_2\end{bmatrix}=\begin{bmatrix}0 & 1\\\frac{g}{l} & 0\end{bmatrix}\begin{bmatrix}\tilde{x}_1\\x_2\end{bmatrix}+\begin{bmatrix}0\\\frac{1}{ml^2}\end{bmatrix}u
$$

## 🧠 What Do Eigenvalues Tell Us?

The eigenvalues of the **A matrix** in the linearized state-space model give us crucial information about how the system behaves near an equilibrium point:

- If **all eigenvalues have negative real parts**, the system **returns to equilibrium** → **Stable**.
- If **any eigenvalue has a positive real part**, the system **diverges** from equilibrium → **Unstable**.
- If eigenvalues are **purely imaginary** (real part = 0), the system may oscillate forever → **Marginally stable**, depends on nonlinearities.

Watch videos 2 and 3 of this playlist if you want to get an intuition of how exactly this works…

---

Lets visualize this with the previous example… Consider the case where there is no external input u. We had already calculated the linearization at the equilibrium points.

## ✅ Case 1: Equilibrium at θ = 0

We had the A matrix:

$$
A = \begin{bmatrix}
0 & 1 \\
-\frac{g}{l} & 0
\end{bmatrix}
$$

Let's calculate its eigenvalues:

$$
\text{det}(A - \lambda I) = \left| \begin{matrix}
-\lambda & 1 \\
-\frac{g}{l} & -\lambda
\end{matrix} \right| = \lambda^2 + \frac{g}{l}
$$

Solving:

$$
\lambda^2 + \frac{g}{l} = 0 \quad \Rightarrow \quad \lambda = \pm i\sqrt{\frac{g}{l}}
$$

### 💡 Interpretation:

- The eigenvalues are purely imaginary.
- This means the system **will keep oscillating** around the downward position.
- Since there's **no damping**, it won't settle on its own.
- But importantly: **it doesn't diverge**, so it's **marginally stable**.

---

## 🚩 Case 2: Equilibrium at θ = π

We had the A matrix:

$$
A = \begin{bmatrix}
0 & 1 \\
\frac{g}{l} & 0
\end{bmatrix}
$$

Eigenvalues:

$$
\text{det}(A - \lambda I) = \lambda^2 - \frac{g}{l} = 0 \quad \Rightarrow \quad \lambda = \pm \sqrt{\frac{g}{l}}
$$

### 💡 Interpretation:

- The eigenvalues are **real and of opposite signs**.
- This means one mode of the system **grows exponentially**, while the other decays.
- So the system **diverges away from the inverted position** if slightly disturbed.
- Hence, this point is **unstable**.

## 🎯 What is Full State Feedback?

**Full state feedback** means:

- We assume we can **measure (or estimate)** *all* the internal states of the system (i.e., the full state vector `x`).
- Then, instead of designing a controller based on just the output, we directly **use the states** to compute the control input.

The general idea is to apply a control input that's a **function of the state**:

$$
u(t) = -Kx(t)
$$

Where:

- `u(t)` is the control input (e.g., force, torque),
- `x(t)` is the state vector (e.g., position, velocity),
- `K` is the **gain matrix** (you choose this to shape the behavior of the system).

> **Important Note:** In the feedback law u = -Kx, the x represents deviations from the equilibrium point. If we linearized around an equilibrium point x₀, then the x in our feedback law actually means (x - x₀). This is crucial for proper implementation of the controller.
> 

---

## 🚀 How Does This Help?

Let's say your system is in state-space form:

$$
\dot{x} = Ax + Bu
$$

Now, apply the **feedback**:

$$
u = -Kx
$$

Substitute this into the original equation:

$$
\dot{x} = Ax + B(-Kx) = (A - BK)x
$$

Voilà! 🎉 You get a **new system matrix**:

$$
A_{\text{closed-loop}} = A - BK
$$

This new matrix defines how the system behaves **after adding the controller**.

---

## 💡 Why Does This Work?

You can now **design** the matrix `K` so that the eigenvalues of `A - BK` are wherever you want them (e.g., in the left half of the complex plane). This lets you:

- **Stabilize** an unstable system,
- **Control the speed** of response,
- **Suppress oscillations** or overshoot.

---

## 🧪 Example: Inverted Pendulum (Again!)

Earlier, we saw that the **inverted pendulum** linearized at 

$$
\theta = \pi
$$

 had:

$$
A = \begin{bmatrix} 0 & 1 \\ \frac{g}{l} & 0 \end{bmatrix}, \quad
B = \begin{bmatrix} 0 \\ \frac{1}{ml^2} \end{bmatrix}
$$

This A matrix is **unstable** (eigenvalues real and of opposite signs).

Now, apply feedback:

$$
u = -Kx = -[k_1 \quad k_2] \begin{bmatrix} \theta \\ \dot{\theta} \end{bmatrix}
$$

Closed-loop system:

$$
\dot{x} = (A - BK)x
$$

With:

$$
BK = \begin{bmatrix} 0 \\ \frac{1}{ml^2} \end{bmatrix} [k_1 \quad k_2] = 
\begin{bmatrix}
0 & 0 \\
\frac{k_1}{ml^2} & \frac{k_2}{ml^2}
\end{bmatrix}
$$

So:

$$
A - BK = 
\begin{bmatrix}
0 & 1 \\
\frac{g}{l} - \frac{k_1}{ml^2} & - \frac{k_2}{ml^2}
\end{bmatrix}
$$

Now you can **choose `k_1` and `k_2`** so that the eigenvalues of this matrix are stable (e.g., negative real parts).

This is what is called “**Pole Placement**”.

## 🔑 1. Controllability

**What is it?**

Controllability tells us **whether we can move the system from any initial state to any final state in finite time using a suitable input**.

In other words, if the system is **controllable**, it means we can *fully command* the behavior of the system using the control input

$$
u(t)
$$

### ✅ Mathematical Check:

For the system

$$
\dot{x} = Ax + Bu
$$

We define the **Controllability Matrix** as:

$$
\mathcal{C} = \begin{bmatrix} B & AB & A^2B & \cdots & A^{n-1}B \end{bmatrix}
$$

- The system is **controllable** if this matrix has **full rank**, i.e.,

$$
\text{rank}(\mathcal{C}) = n
$$

where n is the number of states.

---

## 🚗 2. Reachability

**What is it?**

Reachability is a concept that's very closely related to controllability. In fact, in most linear time-invariant systems, **reachability and controllability are equivalent**.

But conceptually:

- **Reachability** asks: "Can I reach a particular state from the origin using some input?"
- **Controllability** asks: "Can I reach any state from *any* other state?"

For linear systems, both are **effectively the same** — so you can use the same matrix

$$
\mathcal{C}
$$

to check it.

---

## 👀 3. Observability

**What is it?**

Observability is kind of the dual of controllability. It asks:

> Can I determine the internal states of the system just by looking at the output?
> 

Observability is the property of the system that for any possible sequnce of state and control inputs, the current state can be determined in finite time using only the outputs. A matrix which determines if a system is fully observable or not is called the observability matrix. A fully observable system means that it is possible to know all the state variables from the system outputs.

### ✅ Mathematical Check:

For the system

$$
\dot{x} = Ax + Bu, \quad y = Cx
$$

The **Observability Matrix** is:

$$
\mathcal{O} = \begin{bmatrix} C \\ CA \\ CA^2 \\ \vdots \\ CA^{n-1} \end{bmatrix}
$$

- The system is **observable** if this matrix has **full rank**, i.e.,

$$
\text{rank}(\mathcal{O}) = n
$$

---

## 🧠 Why These Matter

- If a system is **not controllable**, you *can't stabilize it* using state feedback. Some modes of the system are "free" and uncontrollable.
- If a system is **not observable**, you *can't estimate* its internal behavior from the output — so even if you have full control, you'll be "blind" to parts of it.
- Before applying feedback like

$$
u = -Kx
$$

you must check **controllability**.

- Before designing an observer (e.g., Lemberger or Kalman filter), check **observability**.

---


---
## **NEXT** ⏩
👉 **[Next: Proceed to Task 3.1](./Task_3.1.md)**
