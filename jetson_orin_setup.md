# Flash System
Check out [SDK Manager](https://docs.nvidia.com/sdk-manager/download-run-sdkm/index.html#login)
# Install SSD

1. 查看设备：
    ```bash
    lsblk
    ```
    如果看到类似 `nvme0n1` 的设备，说明 SSD 识别成功：
    ```
    nvme0n1      259:0    0 238.5G  0 disk
    ```

2. 如果是全新的 SSD，需要格式化：
    ```bash
    sudo mkfs.ext4 /dev/nvme0n1
    ```

3. 创建挂载目录：
    ```bash
    sudo mkdir /mnt/ssd
    ```

4. 挂载 SSD：
    ```bash
    sudo mount /dev/nvme0n1 /mnt/ssd
    ```

5. 为了每次开机自动挂载 SSD，需要修改 `/etc/fstab`：
    ```bash
    sudo nano /etc/fstab
    ```
    添加以下内容：
    ```
    /dev/nvme0n1 /mnt/ssd ext4 defaults 0 0
    ```
    保存并退出（`Ctrl + X → Y → Enter`），然后测试：
    ```bash
    sudo mount -a
    ```
    如果没有错误，说明配置成功。

6. 将 `/home` 目录迁移到 SSD：
    ```bash
    sudo cp -r /home /mnt/ssd
    sudo mv /home /home.bak
    sudo ln -s /mnt/ssd/home /home
    ```

7. 确保用户能够访问 `/home`：
    ```bash
    sudo chown -R mohism0:mohism0 /home/mohism0
    ```

8. 重启系统：
    ```bash
    sudo reboot
    ```

---

# Connect to Wi-Fi Using Terminal

## 查看无线网络接口
使用以下命令查看无线网络接口：
```bash
iwconfig
```
你应该看到类似 `wlan0` 的无线网络接口。如果没有看到，可能需要检查硬件或安装驱动。

## 使用 `nmcli` 配置 Wi-Fi

1. 查看可用的 Wi-Fi 网络：
    ```bash
    nmcli dev wifi list
    ```
    此命令会列出附近的可用 Wi-Fi 网络，显示网络的 SSID（网络名称）以及其他信息。

2. 连接到 Wi-Fi 网络：
    假设你已经看到了一个可用的网络（例如 SSID 为 `MyWiFiNetwork`），可以使用以下命令连接：
    ```bash
    nmcli dev wifi connect "MyWiFiNetwork" password "your_wifi_password"
    ```

---

# Change the Default Docker Directory to `/home`

1. 修改 Docker 配置文件：
    在 `/etc/docker/daemon.json` 中添加以下内容：
    ```json
    {
         "data-root": "/new/path/to/docker"
    }
    ```

2. 重启 Docker 服务：
    ```bash
    sudo systemctl restart docker
    ```

3. 验证更改：
    ```bash
    docker info | grep "Docker Root Dir"
    ```

4. add user to docker group:
```bash
sudo usermod -aG docker $USER
newgrp docker
```

---

# ROS Docker

1. 参考 [Jetson ROS Docker 容器](https://github.com/dusty-nv/jetson-containers/tree/master/packages/ros)。

2. 拉取 Docker 镜像：
    ```bash
    docker pull dustynv/ros:humble-desktop-l4t-r36.4.0
    ```

3. 运行 ROS Docker 容器：
    ```bash
    sudo docker run --runtime nvidia -it -v /home/mohism0/mohism_ws:/root/mohism_ws -w /root/mohism_ws --rm --network=host dustynv/ros:humble-desktop-l4t-r36.4.0
    ```
## Installing Add-on Packages
[jetson-containers](https://github.com/dusty-nv/jetson-containers/blob/master/packages/ros/README.md)

Since the ROS distributions included in these containers are built from source, you should not install additional ROS packages for them from apt - instead these should be built from source too.  There is a helper script for this [`/ros2_install.sh`](ros2_install.sh) which takes either a list of ROS package names or URL of a git repo, and builds/installs them in a ROS workspace:

```
# adds foxglove to ROS_ROOT (under /opt/ros)
/ros2_install.sh foxglove_bridge

# adds jetson-inference nodes under /ros2_workspace
ROS_WORKSPACE=/ros2_workspace /ros2_install.sh 