FROM python:3.9-slim-buster

WORKDIR /robot

RUN apt-get update && \
    apt-get install -yqq curl && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get update && \
    apt-get install -yqq nodejs \
    gcc \
    g++ \
    curl \
    libnss3 \
    libxss1 \
    libasound2 \
    fonts-noto-color-emoji \
    libxtst6 \
    libwoff1 \
    libopus0 \
    libwebp6 \
    libwebpdemux2 \
    libenchant1c2a \
    libgudev-1.0-0 \
    libsecret-1-0 \
    libhyphen0 \
    libgdk-pixbuf2.0-0 \
    libegl1 \
    libnotify4 \
    libxslt1.1 \
    libevent-2.1-6 \
    libgles2 \
    libvpx5 \
    libxcomposite1 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libepoxy0 \
    libgtk-3-0 \
    libharfbuzz-icu0 && \
    rm -rf /var/lib/apt/lists/*

RUN TZ=Europe/Helsinki && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN groupadd -r -g 1000 robotuser && \
    useradd -u 1000 -r -g robotuser robotuser  && \
    mkdir -p /robot/reports && \
    mkdir -p /home/robotuser && \
    chown -R robotuser:robotuser /robot && \
    chown -R robotuser:robotuser /home/robotuser

USER robotuser

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt 

RUN ~/.local/bin/rfbrowser init

ENV NODE_PATH=/usr/lib/node_modules
ENV PATH="/home/robotuser/.local/bin:${PATH}"

COPY entrypoint.sh .
ENTRYPOINT [ "/robot/entrypoint.sh" ]