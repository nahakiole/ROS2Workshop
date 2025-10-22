# ROS 2 Workshop Starter (Docker + Dev Container)

This repo is the minimal, *battle-tested* starter for a 2‑hour ROS 2 hands‑on (Python, Jazzy).  
Works on macOS (Intel/Apple Silicon), Windows (Docker Desktop), and Linux.

## Quick start (VS Code Dev Container)
1. Install **Docker Desktop** and **VS Code** with the **Dev Containers** extension.
2. Open this folder in VS Code. When prompted, click **Reopen in Container**.
3. In the container terminal:
   ```bash
   source /opt/ros/jazzy/setup.bash
   colcon build --symlink-install
   source install/setup.bash
   # terminal A
   ros2 run my_py_pkg talker
   # terminal B
   ros2 run my_py_pkg listener
   ```
4. Introspect:
   ```bash
   ros2 topic list
   ros2 topic echo /chatter
   rqt_graph   # optional in Linux container with X; otherwise skip
   ```

## Without VS Code (pure Docker CLI)
```bash
docker build -t ros2-workshop .
docker run --rm -it --name rosws -v "$PWD":/workspaces/ros2_ws ros2-workshop bash
# inside container:
source /opt/ros/jazzy/setup.bash
colcon build --symlink-install
source install/setup.bash
ros2 run my_py_pkg talker
# in another shell:
docker exec -it rosws bash -lc "source /opt/ros/jazzy/setup.bash && source /workspaces/ros2_ws/install/setup.bash && ros2 run my_py_pkg listener"
```

> Note: On macOS/Windows, `--network host` is not supported. Keep talker/listener in the **same** container.  
> If multiple teams are in the same LAN and you *do* broadcast, set different `ROS_DOMAIN_ID`s.

## Mini-challenge ideas
- Change publish rate (`create_timer` interval).
- Create a custom message and print fields.
- Try QoS: `--qos-reliability best_effort` or `--qos-durability transient_local` (CLI/Node).

## Troubleshooting
- **No output in listener** → Did you run `source install/setup.bash` in *each* terminal?
- **Package not found** → `colcon build` after editing `setup.py` or `entry_points`.
- **Conflicting teams** → Set `export ROS_DOMAIN_ID=42` (pick any 0–232).
- **GUI tools in container** → Prefer CLI; use Linux/X11 if you know what you’re doing.
