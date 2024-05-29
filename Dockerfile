FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-dev \
    build-essential \
    git

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML
RUN pip3 install PyYAML

# Copy the necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
