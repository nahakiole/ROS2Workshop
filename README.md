# ROS 2 Workshop

## 🎯 Goal
Learn the essentials of ROS 2 by building your first node from scratch.

### 📚 You’ll learn
- What a ROS 2 node is
- How to publish & subscribe to topics
- How to build with `colcon`
- How to debug common setup issues
- How to move a simulated turtle 🐢

---

## 1. Initial Setup
1. **Install** 
   - Docker Desktop
   - Visual Studio Code
   - VS Code "Dev Containers" extension
2. Open the **ROS2 Workshop folder** in VS Code.
3. When prompted, click on **"Reopen in Container."** *(or use* `Ctrl/Cmd + Shift + P → Dev Containers: Reopen in Container`*)*
4. Wait until the container finished building (first time ≈ 3 min).

---

## 2. Inside The Container
```bash
source /opt/ros/jazzy/setup.bash
colcon build --symlink-install
source install/local_setup.bash
```

✅ You can now run the empty test node:
```bash
ros2 run my_pkg template
```

You should see: 
```css
[INFO] [my_node]: Node started successfully!
```

## 📋 Useful Commands
| Command | Description |
|---|---|
| source /opt/ros/jazzy/setup.bash | Set up the ROS 2 environment |
| colcon build --symlink-install | Build the workspace |
| source install/local_setup.bash | Source the workspace after build |
| ros2 run <pkg> <exe> | Run a node from a package |
| ros2 topic list | List active topics |
| ros2 topic echo /topic | Print messages from a topic |
| ros2 topic pub /topic std_msgs/String "data: 'hello'" | Publish a message to a topic |
| ros2 node list | List active nodes |

## 3. Troubleshooting
| Problem | Likely cause | Fix |
|---|---|---|
| `ros2: command not found` | ROS environment not sourced | source /opt/ros/jazzy/setup.bash and source install/local_setup.bash. Add to ~/.bashrc for persistent sourcing. |
| `colcon build` fails | Missing dependencies or bad CMake/package.xml | run rosdep install --from-paths src --ignore-src -r -y, fix package.xml/CMakeLists.txt errors, then rebuild. |
| `ros2 run <pkg> <exe>` can't find executable | Package not built / install not sourced / executable not exported | colcon build --symlink-install, source install/local_setup.bash, ensure add_executable and install targets in CMakeLists.txt. |
| No topics shown (`ros2 topic list` empty) | Nodes not running or DDS/network issue | Start your nodes, verify ROS_DOMAIN_ID and RMW_IMPLEMENTATION match, and ensure firewall allows DDS traffic. |
| `ros2 topic echo` prints nothing | Publisher not publishing or QoS mismatch | Verify publisher is active, check message type, and align QoS settings (reliability/keep-last). |
