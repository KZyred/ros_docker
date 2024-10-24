## Without GUI

```
$ docker build -t linux_tes_1 .
$ docker image ls
$ docker run --name linux_test_con -it linux_tes_1
```

## With GUI

```
$ cd ./ros_docker
```

```
$ sudo chmod +x *
or
$ sudo chmod 777 run_docker.bash
```

```
$ sudo ./run_docker.bash
/# source /opt/ros/foxy/setup.bash
```

```
/# ros2 run turtlesim turtlesim_node
or
/# gazebo
```

### Khac phuc loi tran memory out

docker: failed to register layer: write /usr/lib/x86_64-linux-gnu/libvtkIOCore-6.3.so.6.3.0: no space left on device.

```
$ docker container prune
$ docker container prune
```

```
sudo docker rmi $(sudo docker images -q)
```

-> Error response from daemon: conflict: unable to delete fdf887b3401e (must be forced) - image is being used by stopped container f04a073d306e
-> OK -> will be run:

```
$ sudo docker ps -a
$ sudo docker rm <Container_ID>
```
