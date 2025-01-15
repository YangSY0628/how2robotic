**Author:** Shiyuan Yang  
**Email:** shiyuanyang0628@hotmail.com  

**Notice:**
- base_link means the link with "Articulation Roots", it could be other name rather than base_link. To find base_link, on the stage panel click filter->Articulation Roots  

- If you only put the sensor into the same level with the robot base_link, the sensor will not attach to the robot, which means when you move or rotate the robot, the sensor will slip.

# Preparation
Firstly put robot and sensor into a same stage, then remove the upper Xform. Currentlt I do this by save them by "File->Save Flattened As...", and then reopen the saved usd.

Secondly, you may either add a fix joint between robot base_link and the sensor base_link, or put sensor under robot base_link as a child.

# Method 1 add fix joint to connect the sensor base_link with the robot base_link(recommand)
Move the sensor to the wanted position, recommand using "Property->Transform". In the stage panel, put the sensor with robot base_link in the same level, and then "Ctrl+click" both robot base_link and sensor base_link. Then right click "Create->Physics->Joint->Fixed Joint". Right click the robot prim and "Save Selected" as the final USD file with sensor attached to the robot.



# Method 2 put sensor under the robot base_link as a child(with issue)
when you have a sensor or a sensor hub with usd file, basically you can put it directly under the robot base link(with Articluation Root) by the Stage panel. This will let the sensor base_link as the child of the robot base_link.it should be lke [scout_gshub]

However, these issues may happen:

- 2025-01-13 12:47:19 [1,478,136ms] [Error] [omni.isaac.dynamic_control.plugin] DcGetRigidBodyLocalLinearVelocity: Invalid or expired body handle  
You should firstly varift if the base_link has a rigid body. If so, this error would be cause by another error

- 2025-01-13 16:19:59 [5,170,834ms] [Error] [omni.physicsschema.plugin] UsdPhysics: Nested articulation roots are not allowed.  
Currently I just delete the sensors Articluation Root, because this error indicate that there is a Articulation root conflicts

- [Error] [omni.graph.core.plugin] /scout_v2/base_link/GS_Hub/Graph/Odometry/ComputeOdometry: [/scout_v2/base_link/GS_Hub/Graph/Odometry] prim is not a valid rigid body or articulation root  
remove Raw USD Proberties->ExtraProperties->physxArticulation:*


- Rigid Body of (/scout_v2/base_link/GS_Hub/base_link) missing xformstack reset when child of rigid body (/scout_v2/base_link) in hierarchy. Simulation of multiple RigidBodyAPI's in a hierarchy will cause unpredicted results. Please fix the hierarchy or use XformStack reset.  
I did Reset XformStack by setting all the xformOps to default value, but the error still existed. So finally I just delete the sensors rigid body, and it seems no prolem happened

reference:
https://forums.developer.nvidia.com/t/createjoint-no-bodies-defined-at-body-and-body1-joint-prim/253612/4  
https://forums.developer.nvidia.com/t/an-error-omni-physicsschema-plugin-occured-when-importing-custom-usd-file-in-issac-sim/269834  
https://docs.omniverse.nvidia.com/isaacsim/latest/gui_tutorials/tutorial_gui_camera_sensors.html

