FROM python:3.8

RUN pip3 install --no-cache scikit-learn pandas joblib flask requests boto3 tabulate

COPY training-script.py /usr/bin/train
COPY serve-script.py /usr/bin/serve

RUN chmod 755 /usr/bin/train /usr/bin/serve

EXPOSE 8080

# Install Node.js and verify its installation
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    node --version && \
    npm --version && \
    npx --version

# Install CML globally and verify
RUN npm install -g @dvcorg/cml && \
    cml-send-comment --version
