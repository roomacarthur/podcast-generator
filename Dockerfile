FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv

# Upgrade pip and install PyYAML in the virtual environment
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install PyYAML

# Copy the necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entry point
ENTRYPOINT ["/entrypoint.sh"]

# Ensure scripts use the virtual environment
ENV PATH="/opt/venv/bin:$PATH"
