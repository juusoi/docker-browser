FROM marketsquare/robotframework-browser:v2.5.0
WORKDIR /robot
USER root
RUN usermod -u 501 pwuser
USER pwuser
COPY requirements.txt .
RUN pip3 install -r requirements.txt