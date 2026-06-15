# Week 2: CAD and Aerodynamics Design

Welcome to Week 2! This week, we will focus on the fundamentals of Computer-Aided Design (CAD) and introduce you to the core concepts of aerodynamics. By the end of this module, you will understand how to design and analyze aerodynamic shapes.

---

## 1. CAD Basics: SolidWorks & Fusion 360

Before we dive into aerospace design, you need to be comfortable using a 3D CAD software. Below are the best playlists to get you started with either SolidWorks or Fusion 360. You only need to pick **one** software to learn.

### SolidWorks
SolidWorks is an industry standard for mechanical design and is heavily used in the aerospace and automotive sectors.
* **Recommended Playlist:** [SolidWorks Complete Course for Beginners by Chris Sikora](https://www.youtube.com/watch?v=6Nadj1RgT3k&list=PLROUP1bV8RERrsOG6tE3kbRo7qU4gjJ7A)
* **Theory:** SolidWorks is a parametric, feature-based 3D modeling tool. This means you create 2D sketches and use features (like Extrude or Revolve) to turn them into 3D objects. "Parametric" means that dimensions and relations drive the geometry; if you change a dimension, the 3D model automatically updates.

### Autodesk Fusion 360
Fusion 360 is a cloud-based CAD/CAM/CAE tool that is incredibly popular for modern hardware development, student projects, and hobbyists due to its accessibility and integrated simulation tools.
* **Recommended Playlist:** [Learn Autodesk Fusion in 30 Days by Product Design Online](https://www.youtube.com/playlist?list=PLrZ2zKOtC_-C4rWfapgngoe9o2-ng8ZBr)
* **Theory:** Like SolidWorks, Fusion 360 uses a timeline and parametric modeling. It excels in top-down design, where you can design multiple parts within the same workspace (components) and easily assemble them.

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

**In Fusion 360:**
1. Fusion 360 does not natively import XYZ point files easily without add-ins.
2. Go to the "Utilities" tab, click "Add-ins" -> "Scripts and Add-ins".
3. Look for the pre-installed script called **ImportSplineCSV**.
4. You will need to convert your `.dat` file to a `.csv` (Comma Separated Values) format using Excel, ensuring X, Y, and Z (0) columns are separated by commas.
5. Run the script, select your CSV file, and Fusion will generate the airfoil spline!

---

## 5. Introduction to XFLR5

**XFLR5** is an analysis tool for airfoils, wings, and planes operating at low Reynolds numbers. It is a user interface wrapped around the famous "XFOIL" code developed at MIT.

### Theory & Usage
XFLR5 allows you to move from 2D airfoil analysis to full 3D wing and aircraft analysis. 
* **Direct Foil Design:** Here, you can design your own airfoils or import `.dat` files.
* **XFoil Direct Analysis:** This module takes your 2D airfoil and runs fluid dynamics math to calculate Lift, Drag, and Pitching Moment at various Angles of Attack. It generates the "polars" we saw on AirfoilTools.
* **Wing and Plane Design:** You can define a 3D wing by specifying wingspan, chord length at the root and tip, and assigning the 2D airfoils you analyzed. The software then uses methodologies like the Vortex Lattice Method (VLM) or Lifting Line Theory (LLT) to calculate the lift and induced drag of the entire 3D airplane.

---

## 6. Week 2 Task!

Now it's time to put all of this together.

**Your Assignment:**
1. **Choose Software:** Pick either SolidWorks or Fusion 360 and watch the first 3-5 videos of the provided playlist to get comfortable with the interface, sketching, and extruding.
2. **Find an Airfoil:** Go to AirfoilTools.com and search for the **NACA 2412** airfoil (a very famous general aviation airfoil).
3. **Get the Data:** Download the coordinate `.dat` file for the NACA 2412.
4. **CAD Modeling:**
   * Format the coordinate file as needed for your CAD software (TXT for Solidworks, CSV for Fusion 360).
   * Import the curve into your CAD workspace.
   * Extrude the airfoil shape to a length of **500 mm** to create a 3D wing section.
5. **Bonus (Optional XFLR5 intro):** Download XFLR5, import your NACA 2412 `.dat` file, and run a Batch Analysis for a Reynolds number of 100,000 to see the Lift vs Alpha graph!

*Submit a screenshot of your extruded 3D wing in your CAD software!*
