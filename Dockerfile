
FROM ros:humble-ros-base-jammy

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
    git \
    cmake \
    wget \
    tar \
    libx11-dev \
    xorg-dev \
    libssl-dev \
    build-essential \
    libusb-1.0-0-dev \
    libglu1-mesa-dev \
    net-tools \
    iputils-ping \
    libpcl-dev \
    libpcap-dev \
    libboost-dev \
    libyaml-cpp-dev \
    python3-pip \
    python3-rosdep \
    vim \
    libeigen3-dev \
    libasio-dev 

RUN pip3 install -U catkin_tools && \
    pip3 install -U rosdep && \
    rosdep update

WORKDIR /workspace

RUN echo "Installing Eigen 3 last version ..." && \
    apt-get install -y libeigen3-dev

RUN mkdir -p rosworkspace/src && \
    cd rosworkspace && \
    source /opt/ros/humble/setup.bash && \
    colcon build --symlink-install

# Install ros2 branch of KumarRobotics/ublox
RUN cd rosworkspace/src && \
    git clone --branch ros2 https://github.com/KumarRobotics/ublox.git && \
    cd ublox && \
    rosdep install --from-paths . --ignore-src -r -y && \
    cd .. && \
    source /opt/ros/humble/setup.bash && \ 
    colcon build --symlink-install

# USE entrypoint.sh to source ros2 workspace
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

RUN source entrypoint.sh
