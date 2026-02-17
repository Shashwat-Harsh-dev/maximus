# Use Ubuntu 22.04 base image
FROM ubuntu:22.04

# Avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install bash, curl, vim, git, and Python (optional if you want FastAPI etc.)
RUN apt-get update && \
    apt-get install -y \
      bash \
      curl \
      vim \
      git \
      python3 \
      python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Default command: keep container running so you can exec into it
CMD ["tail", "-f", "/dev/null"]
