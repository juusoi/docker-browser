#!/usr/bin/env bash

set -euxo pipefail

cd "$(dirname "$0")"

docker build -t rfbrowser .
docker run -t --rm -v "$(pwd)"/tests:/robot/tests -v "$(pwd)"/reports:/robot/reports rfbrowser --outputdir /robot/reports /robot/tests
