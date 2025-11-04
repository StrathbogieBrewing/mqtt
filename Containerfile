# Use the official Debian slim image as the base
FROM debian:bookworm-slim

# Update packages and install necessary tools (e.g., git, curl)
RUN apt-get update && apt-get install -y mosquitto --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Copy your application code into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Define the command to run when the container starts
CMD ["/bin/bash"]
