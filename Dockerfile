# This is an example Docker File
#  Command to build it
# docker built -t <image name > .# Use ROS Noetic as the base image
FROM osrf/ros:noetic-desktop-full

# Update the package list
RUN apt-get update

# Install necessary tools and dependencies
RUN apt-get install -y git python3-pip

# Create a catkin workspace
RUN mkdir -p ~/catkin_ws/src

# Clone the ros1_wiki repository
RUN git clone https://github.com/noshluk2/ros1_wiki ~/catkin_ws/src/ros1_wiki

# Install turtlesim and other ROS tools
RUN apt-get update && \
    apt-get install -y ros-noetic-turtlesim && \
    apt-get clean

# Enable access to the host's X server
RUN apt-get install -y x11-apps

# Set up catkin workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    cd ~/catkin_ws && \
    catkin_make"

# Source the ROS setup file and workspace setup file
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Display message to confirm setup
RUN echo "ALL Done"

# Set the working directory
WORKDIR /root

# Start the container with a bash shell by default
CMD ["bash"]





