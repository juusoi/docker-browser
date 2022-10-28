#!/bin/sh

docker build -t rfbrowser .
docker run -t --rm -v "$(pwd)"/tests:/robot/tests -v "$(pwd)"/reports:/robot/reports rfbrowser --outputdir /robot/reports /robot/tests
