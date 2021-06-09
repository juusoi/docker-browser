# rfbrowser-slim
A simple docker image with rfbrowser and appium
## Usage 
`docker build -t test .`

`docker run --rm -v $(pwd)/tests:/robot/tests -v $(pwd)/reports:/robot/reports slim --outputdir /robot/reports /robot/tests`