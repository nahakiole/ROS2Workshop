#!/usr/bin/env bash
# ==========================================================
#  Virtual Display Starter for ROS 2 Workshop
#  Launches a browser-based desktop inside the container
#  so GUI apps (like turtlesim) can be viewed via port 6080.
# ==========================================================

#!/usr/bin/env bash
# ==========================================================
# Virtual Display Starter for ROS 2 Workshop
# ==========================================================

# stop any old session first
echo "🧹 Checking for previous virtual display processes..."
pkill Xvfb     2>/dev/null || true
pkill x11vnc   2>/dev/null || true
pkill websockify  2>/dev/null || true
pkill xfce4-session  2>/dev/null || true
sleep 1


# Create virtual display
export DISPLAY=:0
Xvfb :0 -screen 0 1680x1050x16 &> /dev/null &

# Start lightweight window manager
xfce4-session &> /dev/null &

# Start VNC + WebSocket bridge
x11vnc -display :0 -forever -nopw -quiet -rfbport 5900 &> /dev/null &
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &> /dev/null &

echo ""
echo "🖥️  Virtual desktop is now running!"
echo "🌐  Open your browser at http://localhost:6080/vnc.html to view it."
echo "💡  If you're in VS Code, check the 'Ports' tab and click the globe next to port 6080."
echo ""
echo "Once inside the browser desktop, open a terminal and run:"
echo "    source /opt/ros/jazzy/setup.bash"
echo "    ros2 run turtlesim turtlesim_node"
echo ""
echo "To stop this display:  pkill Xvfb x11vnc websockify fluxbox"
echo ""

# Keep container alive
tail -f /dev/null
