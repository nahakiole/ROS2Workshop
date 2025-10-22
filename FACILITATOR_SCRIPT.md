# Facilitator Script (120 min)

**Goal:** everyone builds a ROS 2 workspace, runs talker/listener, and uses CLI to introspect.

## Timeline
- 0–10: Context + goals. Show final result first (`ros2 run my_py_pkg talker` + `listener`).
- 10–20: Dev container boot, `colcon build`, sourcing. Explain nodes, topics.
- 20–40: Live-code walk-through of package layout (show `setup.py`, entry points).
- 40–55: Introspection: `ros2 topic list`, `ros2 topic echo /chatter`, `rqt_graph` (optional).
- 55–80: Hands-on; help participants get talker/listener running.
- 80–100: Mini-challenge (change rate or message; optional custom msg).
- 100–115: QoS demo (show losing messages with best-effort vs reliable).
- 115–120: Wrap-up, pointers (docs, turtlesim, rviz, Foxglove).

## One-liners
- Build: `colcon build --symlink-install`
- Source: `source install/setup.bash` (every new shell)
- Run: `ros2 run my_py_pkg talker` / `ros2 run my_py_pkg listener`
- Introspect: `ros2 topic list` / `ros2 topic echo /chatter`
- Domain isolation: `export ROS_DOMAIN_ID=42`

## Pitfalls
- Forgot `source install/setup.bash` → `Package not found`
- Edited `setup.py` and didn't rebuild → entry point missing
- Multiple teams cross-talking → set `ROS_DOMAIN_ID`

## Stretch
- `ros2 launch my_py_pkg talker_listener.launch.py`
- Add `QoSProfile` in code; try `reliability=BestEffort`
