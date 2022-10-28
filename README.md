# rfbrowser-slim

A simple python image with nodejs, robotframework and robotframework-browser

## Usage

```bash
docker build -t rfbrowser .
```

```bash
docker run -t --rm -v "$(pwd)"/tests:/robot/tests -v "$(pwd)"/reports:/robot/reports rfbrowser --outputdir /robot/reports /robot/tests
```

## Script

```bash
./run-tests.sh
```
