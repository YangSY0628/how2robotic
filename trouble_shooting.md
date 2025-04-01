## Troubleshooting

### Simulator Stuck When Loading Multiple Robots
- pt_main_thread occupy 300% cpu shown on 'top'

### Set tita to kinematic enables
- if set baselink as kinematic, joint between baselink and hips will act very wired(seperated)
- if set all parts as kinematic, all joints will report error: connot creat a joint between static bodies, and all parts will be seperated from each other.
- Instead, setting all parts as non-rigid body seems ok.

### Fix a robot arm with the ground
- Add a root_joint in the USD file, refer to franka example USD

### Memory leak
- Isaac sim has Memory leak issue. If you run the simulator for very long, like a whole night, it may consume all your workstation memory.
### Docker ROS 2: Topics List Available, but No Output on Topic Echo
- By default, ROS 2 uses Fast RTPS (fastrtps) as the DDS implementation, which relies on shared memory for communication on the same machine. However, when using Docker, shared memory may encounter issues. To resolve this, you can:
    1. Use a `fastdds.xml` configuration file:
         ```bash
         export FASTRTPS_DEFAULT_PROFILES_FILE=<PATH>/fastdds.xml
         ```
    2. Alternatively, switch to Cyclone DDS, which does not use shared memory by default.
