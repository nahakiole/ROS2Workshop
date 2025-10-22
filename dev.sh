#!/usr/bin/env bash
set -e
source /opt/ros/jazzy/setup.bash
cd /workspaces/ros2_ws
colcon build --symlink-install
source install/setup.bash
echo "Environment ready. Try: ros2 run my_py_pkg talker"
