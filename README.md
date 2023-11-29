Takes approx 5-6 minutes to build 

Issues to fix
1. Need to source ros2 package after entering the Docker container. Somehow - need to put it in the entrypoint.
```
source rosworkspace/src/install/setup.bash 

```
2. Launch ublox-rtk-ros2-node
```
ros2 launch ublox_gps ublox_gps_node-launch.py 
```
