FROM journeyapps/powersync-service:latest

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /rules /app
WORKDIR /app

# Copy powersync.yaml into the container
COPY powersync.yaml /app/powersync.yaml

EXPOSE 8080

CMD ["powersync-service", "--config=/app/powersync.yaml"]
