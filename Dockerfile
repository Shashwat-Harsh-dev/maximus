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

# Install tools and Python
RUN apt-get update && \
    apt-get install -y bash curl vim git python3 python3-pip && \
    pip3 install fastapi uvicorn && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Copy your app code into the container (optional)
# COPY ./app /workspace/app

# Expose port
EXPOSE 8000

# Start FastAPI server on all interfaces
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
