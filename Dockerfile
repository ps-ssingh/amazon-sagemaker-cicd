FROM python:3.8

RUN pip3 install --no-cache scikit-learn pandas joblib flask requests boto3 tabulate

COPY training-script.py /usr/bin/train
COPY serve-script.py /usr/bin/serve

RUN chmod 755 /usr/bin/train /usr/bin/serve

RUN apt-get update && apt-get install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $HOME/.nvm/nvm.sh \
    && nvm install 14 \
    && nvm use 14 \
    && npm install -g @dvcorg/cml

EXPOSE 8080


