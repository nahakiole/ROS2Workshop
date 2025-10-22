# ROS 2 Workshop — C++ Basics

## Goal
Learn the essentials of ROS 2 by building your first node from scratch.

### You’ll learn
- What a ROS 2 node is
- How to publish & subscribe to topics
- How to build with `colcon`
- How to debug common setup issues
- How to move a simulated turtle 🐢

---

## 1. Initial Setup
1. Install Docker Desktop & VS Code.
2. Install the dev stuff extension.
3. Open this folder in VS Code.
4. Start the docker container by either: 
   - Clicking **“Reopen in Container.”** when prompted.
   - Opening up the command palette (ctrl/cmd+shift+p) and selecting ...

---

## 2. Inside The Container
```bash
source /opt/ros/jazzy/setup.bash
colcon build --symlink-install
source install/local_setup.bash
```

## 3. Troubleshooting

