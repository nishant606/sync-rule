FROM journeyapps/powersync-service:latest

# Install curl for downloading sync rules
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /rules /app

WORKDIR /app

# Expose port
EXPOSE 8080

# Start command (will be overridden by Railway)
CMD ["powersync-service", "--host=0.0.0.0", "--port=8080"]
