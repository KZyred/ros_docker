# If not working, first do: sudo rm -rf /tmp/.docker.xauth
# It still not working, try running the script as root.
## Build the image first
### docker build -t r2_path_planning .
## then run this script
#!/bin/bash

# Allow local root to access the X server
xhost +local:root

# Set up the X11 authentication
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# Run the Docker container with X11 forwarding enabled
docker run -it \
    --name=r2_pathplanning_container \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    haiderabbasi333/ros2-pathplanning-course:1 \
    bash

# Cleanup and revert the local root access to the X server
xhost -local:root

echo "Done."
