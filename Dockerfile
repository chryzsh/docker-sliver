FROM ubuntu:24.04

# Update the package list and install required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Create the /opt/sliver directory
RUN mkdir -p /opt/sliver

# Download Sliver version 1.5.39 from GitHub releases
RUN curl -L -o /opt/sliver/sliver-server https://github.com/BishopFox/sliver/releases/download/v1.5.39/sliver-server_linux && \
    chmod +x /opt/sliver/sliver-server

# Set the workdir to .sliver directory which can be mounted
WORKDIR /root/.sliver

# Set the entrypoint to the sliver-server binary
ENTRYPOINT ["/opt/sliver/sliver-server", "daemon"]
