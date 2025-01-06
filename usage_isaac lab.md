```markdown
## Basic Usage

To preview, press `Ctrl + Shift + V`.

### Useful Links
- [Closing the Sim-to-Real Gap: Training Spot Quadruped Locomotion with NVIDIA Isaac Lab](https://developer.nvidia.com/blog/closing-the-sim-to-real-gap-training-spot-quadruped-locomotion-with-nvidia-isaac-lab/)
- [Isaac Lab Tutorials](https://docs.omniverse.nvidia.com/isaacsim/latest/isaac_lab_tutorials/index.html)
- [Policy Deployment Tutorial](https://docs.omniverse.nvidia.com/isaacsim/latest/isaac_lab_tutorials/tutorial_policy_deployment.html)
- [CSDN Blog](https://blog.csdn.net/u010321827/article/details/140929275?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-140929275-blog-126393698.235^v43^pc_blog_bottom_relevance_base9&spm=1001.2101.3001.4242.3&utm_relevant_index=7)

### Steps to Use Isaac Lab

1. Activate the Isaac Lab environment:
    ```sh
    conda activate isaaclab
    ```

2. Navigate to the Isaac Lab directory:
    ```sh
    cd <path_to_isaac_lab>
    ```

3. Run the desired task command:
    ```sh
    ./isaaclab.sh <your task command>
    ```

4. Example command to train a model:
    ```sh
    ./isaaclab.sh -p source/standalone/workflows/rsl_rl/train.py --task Isaac-Velocity-Flat-Unitree-Go2-v0 --num_envs 4096 --headless --video --enable_cameras
    ```

5. After training, run the following command to play the trained model:
    ```sh
    ./isaaclab.sh -p source/standalone/workflows/rsl_rl/play.py --task Isaac-Velocity-Flat-Unitree-Go2-v0 --num_envs 4096
    ```
    This will play the trained model, allowing you to see its performance. It will also export the checkpoint file to a model file.

    **Note:** The checkpoint file does not contain `constant.pkl`, which is used to temporarily store training status. For more details, see [this blog](https://zhuanlan.zhihu.com/p/594168482).

6. After playing and exporting, navigate to:
    ```
    /home/ubuntu-user/robot_repo/shiyuan_ws/IsaacLab/logs/rsl_rl/unitree_go2_flat/2024-12-30_13-55-59/exported
    ```
    There should be `.pt` and `.onnx` files as the final model files.

### Issue

When running the following command:
```sh
./isaaclab.sh -p source/standalone/workflows/rsl_rl/train.py --task Isaac-Velocity-Flat-Spot-v0 --num_envs 4096 --headless --video --enable_cameras
```
You might encounter the following error:
```
omegaconf.errors.UnsupportedValueType: Value 'Tensor' is not a supported primitive type
    full_key: env.scene.robot.actuators.spot_knee.joint_parameter_lookup
    object_type=dict
```

Re-installing Isaac Lab v1.3.0 (GitHub - isaac-sim/IsaacLab at v1.3.0) instead of the master branch resolved the issue, indicating a potential issue between versions 1.3.0 and the master branch.
```
