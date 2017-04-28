#!/bin/bash
# Starts the Mongoose-OS utils using the docker image.

docker run \
    -it \
    --rm \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev:/dev \
    -v $HOME/topics:/topics \
    tombenke/dmos:latest \
    /bin/bash
