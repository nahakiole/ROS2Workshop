# Dev container base for workshop
FROM ros:jazzy-ros-base

SHELL ["/bin/bash","-lc"]

# Basics and colcon tooling
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    ros-dev-tools \
    ros-jazzy-turtlesim && \
    rm -rf /var/lib/apt/lists/*
  
RUN apt-get update && apt-get install  -y --no-install-recommends xvfb fluxbox x11vnc websockify novnc xfce4 dbus-x11 xfce4-terminal ros-jazzy-desktop

# Workspace
RUN mkdir -p /workspaces/ros2_ws/src
WORKDIR /workspaces/ros2_ws

# Convenience: always have ROS env loaded in interactive shells
RUN echo 'source /opt/ros/jazzy/setup.bash' >> /etc/bash.bashrc
