FROM journeyapps/powersync-service:latest

# Install curl for downloading files
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /rules /app

# Set working directory
WORKDIR /app

# Expose port
EXPOSE 8080

# Default command
CMD ["powersync-service", "--host=0.0.0.0", "--port=8080"]
