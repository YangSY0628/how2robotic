# lidar
When lidar connect to pc or jetson, there's no /dev/ttyUSB0
dmesg | grep tty

[233037.102083] usb 1-2: ch341-uart converter now attached to ttyUSB0
[233037.835071] usb 1-2: usbfs: interface 0 claimed by ch341 while 'brltty' sets config #1
[233037.835531] ch341-uart ttyUSB0: ch341-uart converter now disconnected from ttyUSB0

从 dmesg 的日志来看，设备最开始成功连接到了 /dev/ttyUSB0，但随后被 brltty 占用并断开了。这通常是因为 brltty（盲文显示器的驱动）错误地接管了你的 USB 转串口设备。

sudo apt remove brltty


# rviz
frame_id = laser_link

odom -> laser_link is needed
ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 odom laser_link 