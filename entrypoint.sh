#!/bin/bash

# Debugging: Print current working directory
echo "Current working directory: $(pwd)"

# Debugging: List the contents of the current directory
echo "Contents of current directory:"
ls -l

# Source ROS 2 setup file
source /opt/ros/humble/setup.bash

# Source your workspace setup file
source rosworkspace/src/install/setup.bash

# # Your launch command
# ros2 launch ublox_gps ublox_gps_node-launch.py
