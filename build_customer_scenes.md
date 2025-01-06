- Notice: Directly importing assets (.usd or .obj) from outside Isaac Sim or Omniverse may cause materials to be lost or other issues. So the safer way is to build or import the basic model outside Isaac Sim, and add materials, physics, and other stuff inside Isaac Sim or Omniverse.

USD composer uses cm, isaac sim uses m. This may cause scale problem when import usd. 
solution: ajust in isaac sim. shrink the scaled larger models by 0.01 in property->transform->scale, then right click the models in stage window, save selected as a new usd(why new file are larger then original?)

- useful tools: blender, USD Composer, USD Explorer

blender: to build basic geometric models
USD Explorer: view and check assets
USD Composer: add physics, materials. save as .usd files



https://free3d.com/3d-models/
# Constructing a Scene in NVIDIA Isaac Sim

This tutorial provides a step-by-step guide to building a 3D scene in Isaac Sim. We will cover the basic setup, adding objects, and configuring the scene for simulation.

---

## Prerequisites
- **Isaac Sim installed**: Ensure you have Isaac Sim installed and running on your system.
- **Basic familiarity**: Some understanding of 3D modeling and simulation concepts is helpful.
- **Some opensource assets web**:
https://free3d.com/3d-models/


---

## 1. Launch Isaac Sim
1. Open Isaac Sim from your installed applications.
2. Create a new project or open an existing one.
3. Familiarize yourself with the **viewport**, **stage**, and **toolbar**.

---

## 2. Create a New Scene
1. Go to the **File** menu and select **New** to start a fresh scene.
2. Save the scene:
   - **File -> Save As**.
   - Choose a location and provide a name, e.g., `MyScene.usd`.

---

## 3. Add a Ground Plane
1. In the **Create** menu (or toolbar), select **Physics -> Ground Plane**.
   - A flat plane is added to the scene for objects to rest on.

---

## 4. Add 3D Objects
### Method 1: Using the Asset Browser
1. Open the **Asset Browser** from the bottom panel.
2. Browse the library or search for assets (e.g., `cube`, `robot`, `table`).
3. Drag and drop the asset into the viewport or stage hierarchy.

### Method 2: Manually Adding Primitives
1. Go to the **Create** menu.
2. Select a primitive shape (e.g., **Cube**, **Sphere**, or **Cylinder**).
3. Use the **Move**, **Rotate**, and **Scale** tools in the toolbar to position and size the object.

---

## 5. Configure Materials and Textures
1. Select the object you want to customize in the **Stage** hierarchy.
2. Open the **Material Editor**.
3. Assign a new material or drag-and-drop a material from the **Asset Browser**.
4. Customize properties like color, texture, and reflectivity.

---

## 6. Add Lighting
1. From the **Create** menu, select a light type:
   - **Distant Light**: Simulates sunlight.
   - **Point Light**: Emits light in all directions from a point.
   - **Spot Light**: Focused directional light.
2. Position the light source using the transform tools.

---

## 7. Configure Physics
1. Enable physics for objects:
   - Right-click the object in the **Stage** hierarchy.
   - Select **Add -> Physics -> Rigid Body**.
2. Add colliders:
   - Right-click the object and choose **Add -> Physics -> Collider**.
   - Adjust collider properties if needed.

---

## 8. Simulate the Scene
1. Click the **Play** button in the toolbar to start the simulation.
2. Observe object interactions and adjust physics or environment settings as needed.
3. Pause or stop the simulation to make changes.

---

## 9. Save and Export
1. Save the scene frequently:
   - **File -> Save**.
2. Export the scene if required:
   - **File -> Export -> USD/OBJ**.

---

## Additional Tips
- Use the **Camera Controls** to navigate the scene and set up desired views.
- Utilize the **OmniGraph** editor for advanced control and automation.
- Leverage pre-built robot models and environments for complex simulations.

---

### Resources
- [Isaac Sim Documentation](https://developer.nvidia.com/isaac-sim)
- [NVIDIA Developer Forums](https://forums.developer.nvidia.com/)

---

With this guide, you should be able to construct and simulate basic scenes in Isaac Sim. Happy simulating!