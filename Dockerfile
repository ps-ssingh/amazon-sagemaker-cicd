FROM python:3.8

RUN pip3 install --no-cache scikit-learn pandas joblib flask requests boto3 tabulate

COPY training-script.py /usr/bin/train
COPY serve-script.py /usr/bin/serve

RUN chmod 755 /usr/bin/train /usr/bin/serve

EXPOSE 8080

# Add the NodeSource Node.js v18.x repo and install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Verify Node.js and npm installations
RUN node --version && npm --version && npx --version

# Install CML globally
RUN npm install -g @dvcorg/cml
