# PowerSync Dockerfile - Downloads sync rules at build time
FROM journeyapps/powersync-service:latest

# Create directories
RUN mkdir -p /rules /app

WORKDIR /app

# Copy config file
COPY powersync.yaml /app/powersync.yaml

# Download sync rules during build (Railway has internet during build)
ADD https://raw.githubusercontent.com/nishant606/sync-rule/main/sync_rules.yaml /rules/sync_rules.yaml

# Expose port
EXPOSE 8080

# Start command
CMD ["powersync-service", "--config=/app/powersync.yaml", "--host=0.0.0.0", "--port=8080"]
