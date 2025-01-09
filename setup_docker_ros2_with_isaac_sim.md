author: Shiyuan Yang  
This tutorial will guide you through the steps to set up Docker ROS 2 to work with local Isaac Sim.  
It only tested on docker terminal version, using docker desktop may need additional configurations

For more information: https://github.com/YangSY0628/how_to_use_isaac_sim

## Prerequisites

- **Docker Ros2**: Ensure Docker is installed on your system. You can download and install Docker from Docker's official website. For information on how to set up Docker for ROS, you can also refer to [this blog post](https://blog.csdn.net/zysss_/article/details/134125740?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7EPaidSort-1-134125740-blog-142616408.235%5Ev43%5Epc_blog_bottom_relevance_base4&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7EPaidSort-1-134125740-blog-142616408.235%5Ev43%5Epc_blog_bottom_relevance_base4&utm_relevant_index=1).
- **Isaac Sim**: refer to https://docs.omniverse.nvidia.com/isaacsim/latest/installation/install_ros.html#isaac-sim-app-enable-ros

## Step 1: Setup docker environment 

Ideally, you should use a [Dockerfile](https://github.com/MohismLab/MohismLab_HomePage/tree/main/isaac_sim) to manage the environment. A Dockerfile automates the setup of consistent, reproducible environments, reducing errors from manual configuration. It ensures applications run identically across development, testing, and production. Additionally, it allows version control of configurations, enabling better infrastructure management.

Simply run the following command in the directory containing the Dockerfile:
```bash
docker build -t my-python-app .
```
If you are at the very beginning without a Dockerfilepull,you start with `FROM osrf/ros:humble-desktop-full` to build one.

## Step 2: Create and Run the Docker Container

Run the Docker container with the necessary environment variables and volume mounts to enable GUI applications and access to your local files.

```bash
docker run -it \
    --name ros2-humble-container \
    --network host \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/ubuntu-user/robot_repo:/home/robot_repo" \
    osrf/ros:humble-desktop-full \
    rqt
```
after created container, next time run below to start it:
```bash
# Allow local connections to the X server
docker inspect --format='{{ .Config.Hostname }}' ros2-humble-container
docker start ros2-humble-container
docker exec -it ros2-humble-container /bin/bash
```
## Step 3: Configure ROS 2 with Isaac Sim
Ensure that your ROS 2 environment is properly configured to communicate with Isaac Sim. You may need to set environment variables and source the ROS 2 setup script.

```bash
# Must be identical to Isaac Sim ROS_DOMAIN_ID, set RMW_IMPLEMENTATION for Isaac Sim ros2 bridge
export ROS_DOMAIN_ID=0
source /opt/ros/humble/setup.bash
export FASTRTPS_DEFAULT_PROFILES_FILE=/home/robot_repo/humble_ws/fastdds.xml 

```

## Step 4: Launch Isaac Sim with ROS 2 Support
When launching Isaac Sim from the NVIDIA Omniverse Launcher, set `export RMW_IMPLEMENTATION=rmw_fastrtps_cpp` under "Extra Args" to ensure it uses the correct ROS 2 configuration.
![image](https://github.com/MohismLab/MohismLab_HomePage/blob/main/isaac_sim/images/Screenshot%20from%202024-12-03%2016-53-35.png)

## Step 5: Verify the Setup
To verify that everything is set up correctly, you can run a simple ROS 2 node and check if it communicates with Isaac Sim.
`ros2 run demo_nodes_cpp talker`
In Isaac Sim, you should be able to see the ROS 2 topics being published and subscribed to.

# docker network issue in China Mainland
If you encounter connection issues while building Docker images in China mainland, refer to the [Docker proxy settings](https://docs.docker.com/engine/daemon/proxy/#daemon-configuration).
You may also use `docker pull` before `docker build`, since directly running `docker pull` may report connection faliure.  
You may also need to docker login to pull image 
