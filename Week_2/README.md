# Week 2: CAD and Aerodynamics Design

Welcome to Week 2! This week, we will focus on the fundamentals of Computer-Aided Design (CAD) and introduce you to the core concepts of aerodynamics. By the end of this module, you will understand how to design and analyze aerodynamic shapes.

---

## 1. CAD Basics: SolidWorks & Fusion 360

Before we dive into aerospace design, you need to be comfortable using a 3D CAD software. Below are the best playlists to get you started with either SolidWorks or Fusion 360. You only need to pick **one** software to learn and you do not need to see all the videos of these playlist, just get familiar with the basic tools and with practice and experience you will be able to design anything.

### SolidWorks
* **Playlist:** [SolidWorks Complete Course for Beginners](https://youtu.be/8lHEizPf-wY?si=WEGp87t_BrtVRkMB)

### Autodesk Fusion 360
* **Playlist:** [Learn Autodesk Fusion in 30 Days by Product Design Online](https://youtube.com/playlist?list=PLrZ2zKOtC_-C4rWfapgngoe9o2-ng8ZBr&si=3qGGT3v2gE4viqPz)

---

## 2. Aerodynamics Basics: Airfoils, Lift, and Drag

To design a wing or a propeller, you must first understand the 2D cross-section of a wing, known as an **Airfoil**.

### Airfoil Geometry
An airfoil is a specialized shape designed to generate aerodynamic forces as it moves through a fluid (air).
* **Leading Edge (LE):** The front-most point of the airfoil.
* **Trailing Edge (TE):** The rear-most sharp point of the airfoil.
* **Chord Line:** The straight line connecting the Leading Edge to the Trailing Edge. The length of this line is the **Chord (c)**.
* **Camber Line:** The line that is halfway between the upper and lower surfaces of the airfoil. If the camber line lies exactly on the chord line, the airfoil is **symmetrical**. If it curves above or below, it is **cambered**.
* **Thickness:** The maximum distance between the upper and lower surfaces.

### Lift and Drag
When air flows over an airfoil, it generates aerodynamic forces:
* **Lift:** The force perpendicular to the oncoming airflow. Due to the airfoil's shape and angle of attack (the angle between the chord line and the oncoming air), air moves faster over the top surface than the bottom. According to Bernoulli's principle, this higher velocity creates lower pressure on top, sucking the wing upward.
* **Drag:** The force parallel to the oncoming airflow that resists the motion of the object. It consists of:
  * *Parasite Drag:* Caused by skin friction (air rubbing against the surface) and form drag (due to the object's shape).
  * *Induced Drag:* A byproduct of lift. As high-pressure air from the bottom tries to roll over to the low-pressure top at the wingtips, it creates swirling vortices that drag the aircraft backward.

**Source:** [Basic Airfoil Theory](https://airshaper.com/videos/airfoil-design-for-a-drone/kAXN3MlQxxc)

**NACA CONVENTION:** [NACA](https://towardsdatascience.com/introduction-to-naca-airfoil-aerodynamics-in-python-72a1c3ee46b1/)

---

## 3. AirfoilTools.com

[AirfoilTools.com](http://airfoiltools.com/) is an extensive, free online database used by aerospace engineers and hobbyists to search for and analyze airfoil shapes.

### How to use it:
1. **Search:** You can search for specific airfoils (e.g., "NACA 4412" or "Clark Y") using the search bar.
2. **Details & Geometry:** Clicking on an airfoil shows its shape and provides the coordinate data (typically X and Y points).
3. **Aerodynamic Polars:** The site provides pre-calculated graphs (polars) generated using XFOIL. These graphs show how the airfoil performs at different angles of attack (Alpha) and Reynolds numbers (a dimensionless number indicating the flow regime, related to speed and size).
   * *Cl vs Alpha:* Shows how Lift Coefficient changes with Angle of Attack.
   * *Cl vs Cd:* The drag polar, showing the trade-off between Lift and Drag.
4. **Data Export:** You can export the raw coordinates by clicking **"Send to DAT file"**.

**Source:** [Airfoil tools Tutorial](https://youtu.be/Va7G5UFtbQg?si=qdgmbCXdYVWjYgRe)

---

## 4. Working with .DAT Files in CAD

A `.dat` file in this context is a simple text file containing the X and Y coordinates that define the airfoil's upper and lower curves.

### Importing a .DAT file into CAD
To make a 3D wing, you need to bring these coordinates into your CAD software.

**In SolidWorks:**
1. Download the `.dat` file from AirfoilTools.
2. You may need to format it slightly in Excel (ensure there are 3 columns: X, Y, and Z. Z should be 0). Save it as a text file (`.txt`).
3. In SolidWorks, go to `Insert > Curve > Curve Through XYZ Points`.
4. Browse to your text file and click OK. This generates a curve.
5. Create a sketch on the appropriate plane and use `Convert Entities` to turn the curve into a usable sketch. Extrude the sketch to create your wing!

**Source:** [Wing making in Solidworks](https://youtu.be/WghUm2gDb-c?si=EnaqzlcfaJ8ow9gT)

**In Fusion 360**
1. Download the `.dat` file from AirfoilTools.
2. Use an airfoil import add-in/script available through Fusion 360's Scripts and Add-ins menu.
3. Generate the airfoil spline.
4. Use the resulting sketch to build your wing geometry.


**Source:** [Wing making in Fusion 360](https://youtu.be/E2UXGXp1xfo?si=ZGt-_gyBkr-vHiyH)

---

## 5. Introduction to XFLR5

**XFLR5** is an analysis tool for airfoils, wings, and planes operating at low Reynolds numbers. It is a user interface wrapped around the famous "XFOIL" code developed at MIT.

### Theory & Usage
XFLR5 allows you to move from 2D airfoil analysis to full 3D wing and aircraft analysis. 
* **Direct Foil Design:** Here, you can design your own airfoils or import `.dat` files.
* **XFoil Direct Analysis:** This module takes your 2D airfoil and runs fluid dynamics math to calculate Lift, Drag, and Pitching Moment at various Angles of Attack. It generates the "polars" we saw on AirfoilTools.
* **Wing and Plane Design:** You can define a 3D wing by specifying wingspan, chord length at the root and tip, and assigning the 2D airfoils you analyzed. The software then uses methodologies like the Vortex Lattice Method (VLM) or Lifting Line Theory (LLT) to calculate the lift and induced drag of the entire 3D airplane.

**Source:** [XFLR5 Tutorial](https://youtu.be/q4lJGhhLEGs?si=Wn3ob8Ddx4gEkrKy)
---

## 6. Week 2 Task!

Now it's time to put all of this together.

**Your Tasks:**
1. **CAD TASK:** You have to design a motor holder of a drone, you can take ideas from existing models or it may be a new design, you can assume the dimensions of arm and motor mounting holes according to yourself.

**Submission link:** [Task 2.1](https://docs.google.com/forms/d/e/1FAIpQLSe03nh64q3MK5mXDnU0rWJ96UCTdimGB0ub67By7raiDl3g7A/viewform?usp=publish-editor)

2. **Airfoil Analysis:** Take any three airfoils and compare their Cl,Cd,Cl/Cd in Airfoil tools.com and which of them will you recommend for a STOL(Short Take Off Landin) Aircraft.(Take Re in the range of 50k to 200k and Ncrit in the range of 4-8).

**Submission link:** [Task 2.2](https://docs.google.com/forms/d/e/1FAIpQLSe24yirZRg5J476XqvlUgbTs3Evy8WxnITapcOzN6TztJ3-HQ/viewform?usp=publish-editor)


3. **Wing Making:** Download the coordinate of the airfoil you just recommended and make a wing of span=400mm and sweep of 15 degrees.(A wing sweep angle is the angle at which an aircraft's wings are angled backward (or sometimes forward) relative to the lateral axis of the fuselage).

**Submission link:** [Task 2.3](https://docs.google.com/forms/d/e/1FAIpQLSesmJseQIS6uz7xZ7GfP_BksRVup6Q79nGsPVbcWGRU10Ix4Q/viewform?usp=publish-editor)


4. **XFLR5:** Take any three NACA airfoils and compare their Cl,Cd,Cl/Cd XFLR5. (Take Re in the range of 50k to 200k and Ncrit in the range of 4-8 and Mach number in the range of 0 to 0.5).

**Submission link:** [Task 2.4](https://docs.google.com/forms/d/e/1FAIpQLSfWArKLnRsybqwEQgW-cjjYK309flMI35xnjeiBb5IkPqvKcw/viewform?usp=publish-editor)


Note- Submit step files in 1st and 3rd part and a small report showing plots and your choosen airfoils in 2nd and 4th.
