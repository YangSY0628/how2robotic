FROM osrf/ros:humble-desktop-full

LABEL maintainer="mc45197@um.edu.mo"

# Install linux packages
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-pip \
    python3-venv \
    ros-humble-ackermann-msgs \
    ros-humble-teleop-twist-keyboard \
    vim \
    ros-humble-tf-transformations \
    # ros-humble-navigation2 \
    # ros-humble-nav2-bringup \
    && rm -rf /var/lib/apt/lists/*

RUN pip install transforms3d

# you can change the directory name to your own
WORKDIR /root/humble_ws/

# RUN git clone https://github.com/isaac-sim/IsaacSim-ros_workspaces.git && \
#     cp -r IsaacSim-ros_workspaces/humble_ws /root/humble_ws

# Compile ROS packages
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && \
    cd /root/humble_ws && \
    colcon build && \
    echo 'source /opt/ros/humble/setup.bash' >> /root/.bashrc"

ENV ROS_DOMAIN_ID=0 \
    FASTRTPS_DEFAULT_PROFILES_FILE=./humble_ws/fastdds.xml


