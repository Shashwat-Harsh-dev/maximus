# Use Ubuntu 22.04
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && \
    apt-get install -y bash curl vim git python3 python3-pip net-tools && \
    rm -rf /var/lib/apt/lists/*

# Install a lightweight web-based terminal: wetty
RUN pip3 install wetty

# Create working directory for static site
WORKDIR /workspace

# Copy your static site into container
COPY ./static ./static

# Expose ports for web server and wetty CLI
EXPOSE 8080

# Start Wetty CLI on / terminal and serve static site
CMD ["wetty", "--port", "8080", "--command", "/bin/bash"]
