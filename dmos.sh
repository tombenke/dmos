#!/bin/bash
# Starts the Mongoose-OS utils using the docker image.

PROJECTS=$HOME/topics       # Set the base path to your topics/projects directory
SANDBOX=$HOME/sandbox/mos   # Set the base path to your sandbox directory
SERIAL_PORT=/dev/ttyUSB0    # Define the serial port you are willing to use

docker run \
    -it \
    --rm \
    --privileged \
    --name dmos \
    -e DISPLAY=$DISPLAY \
    -p 1992:1992 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $SERIAL_PORT:$SERIAL_PORT \
    -v $PROJECTS:/home/developer/projects \
    -v $SANDBOX:/home/developer/sandbox \
    tombenke/dmos:latest \
    /bin/bash
