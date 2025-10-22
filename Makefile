SHELL := /bin/bash
WS=/workspaces/ros2_ws

.PHONY: build talker listener launch clean

build:
	bash -lc 'source /opt/ros/jazzy/setup.bash && cd $(WS) && colcon build --symlink-install'

talker:
	bash -lc 'source /opt/ros/jazzy/setup.bash && cd $(WS) && source install/setup.bash && ros2 run my_py_pkg talker'

listener:
	bash -lc 'source /opt/ros/jazzy/setup.bash && cd $(WS) && source install/setup.bash && ros2 run my_py_pkg listener'

launch:
	bash -lc 'source /opt/ros/jazzy/setup.bash && cd $(WS) && source install/setup.bash && ros2 launch my_py_pkg talker_listener.launch.py'

clean:
	rm -rf build install log
