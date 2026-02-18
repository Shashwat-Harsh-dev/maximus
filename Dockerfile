# # Use Ubuntu 22.04
# FROM ubuntu:22.04

# # Prevent interactive prompts
# ENV DEBIAN_FRONTEND=noninteractive

# # Install useful CLI tools
# RUN apt-get update && \
#     apt-get install -y \
#         bash \
#         curl \
#         vim \
#         git \
#         python3 \
#         python3-pip && \
#     rm -rf /var/lib/apt/lists/*

# # Set working directory
# WORKDIR /workspace

# # Expose port 8000 (or any port you want)
# EXPOSE 8000

# # Default command: keep container running
# CMD ["tail", "-f", "/dev/null"]
# Use Ubuntu 22.04
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        bash \
        curl \
        wget \
        git \
        vim \
        iputils-ping \
        dnsutils \
        net-tools \
        traceroute \
        nmap \
        ttyd && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

EXPOSE 8000

CMD ["ttyd", "-p", "8000", "bash"]
