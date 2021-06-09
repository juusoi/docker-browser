# rfbrowser-slim
A simple docker python image with nodejs, robotframework and robotframework-browser
## Usage 
`docker build -t test .`

`docker run --rm -v $(pwd)/tests:/robot/tests -v $(pwd)/reports:/robot/reports test --outputdir /robot/reports /robot/tests`