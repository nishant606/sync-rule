# PowerSync Dockerfile - No root permissions needed
FROM journeyapps/powersync-service:latest

# Set working directory (should have permissions here)
WORKDIR /home/powersync

# Copy config file
COPY powersync.yaml ./powersync.yaml

# Download sync rules during build
ADD https://raw.githubusercontent.com/nishant606/sync-rule/main/sync_rules.yaml ./sync_rules.yaml

# Expose port
EXPOSE 8080

# Start command
CMD ["powersync-service", "--config=/home/powersync/powersync.yaml", "--host=0.0.0.0", "--port=8080"]
