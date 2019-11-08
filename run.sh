#!/bin/bash

IMAGE_FILE=$1
WEIGHTS_FILE="yolov3-openimages.weights"

if [ -z "$1" ]; then
    echo "Usage: run.sh data/some_image.jpg"
    exit 1
fi

if [ ! -f "${WEIGHTS_FILE}" ]; then
    wget "http://pjreddie.com/media/files/${WEIGHTS_FILE}"
fi

make

./darknet detector test cfg/openimages.data cfg/yolov3-openimages.cfg "${WEIGHTS_FILE}" "${IMAGE_FILE}" -thresh 0.1
