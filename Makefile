IM_NAME=ipbalfredo/rtk-node:humble
CONT_NAME=ublox-rtk-ros2-node-container # You will need to apply the exact same name to container_name in orb-container/docker-compose.yml

default: up enter

up:
	docker compose up -d

run:
	docker run -it --privileged --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix   --network=host --name ${CONT_NAME} ${IM_NAME} bash

enter:
	clear && docker exec -it ${CONT_NAME} bash

lauch_fix:
	docker exec -it ${CONT_NAME} bash -c ". /workspace/rosworkspace/install/setup.bash && ros2 launch ublox_gps ublox_gps_node-launch.py"

down:
	docker compose down

build_without_cache:
	docker build --no-cache -t ${IM_NAME} .

build:
	docker build -t ${IM_NAME} .
delete_rtk_docker:
	docker rmi ${IM_NAME}
