cmake_minimum_required(VERSION 3.5)
project(my_pkg)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

# build an executable called "template"
add_executable(template src/template.cpp)
ament_target_dependencies(template rclcpp std_msgs)

# install it so colcon knows how to copy it to install/
install(TARGETS
  template
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()
