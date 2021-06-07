FROM python:3.9-slim
WORKDIR /robot

 RUN apt-get update && \
     apt-get install -yqq curl && \
     curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
     apt-get update && \
     apt-get install -yqq nodejs gcc g++ make build-essential
#     && apt-get install --no-install-recommends --no-install-suggests --assume-yes nodejs
#     curl unzip gnupg xvfb \
#     && CHROME_DOWNLOAD_URL='https://dl.google.com/linux' \
#     && curl -sL "${CHROME_DOWNLOAD_URL}/linux_signing_key.pub" | apt-key add - \
#     && curl -sL "${CHROME_DOWNLOAD_URL}/direct/google-chrome-stable_current_amd64.deb" > /tmp/chrome.deb \
#     && (dpkg -i /tmp/chrome.deb || apt-get install --no-install-recommends --no-install-suggests --assume-yes --fix-broken) \
#     && CHROMIUM_FLAGS='--no-sandbox --disable-dev-shm-usage' \
#     && CHROMIUM_OPTIONS_FILE=/opt/google/chrome/google-chrome \
#     && echo "$(cat ${CHROMIUM_OPTIONS_FILE}) ${CHROMIUM_FLAGS}" > "${CHROMIUM_OPTIONS_FILE}" \
#     && BASE_URL='https://chromedriver.storage.googleapis.com' \
#     && VERSION=$(curl -sL "${BASE_URL}/LATEST_RELEASE") \
#     && curl -sL "${BASE_URL}/${VERSION}/chromedriver_linux64.zip" -o /tmp/driver.zip \
#     && unzip /tmp/driver.zip \
#     && chmod 0755 chromedriver \
#     && mv chromedriver /usr/local/bin/ \
#     && apt-get purge -y curl unzip gnupg \
#     && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
#     && rm -rf /tmp/* /usr/share/doc/* /var/cache/* /var/lib/apt/lists/* /var/tmp/* 

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN rfbrowser init

COPY entrypoint.sh /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

COPY tests/tests.robot tests/

RUN apt-get install -yqq libnss3 libnspr4 libglib2.0-0 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libpango1.0-0 libcairo2 libasound2 libxshmfence1