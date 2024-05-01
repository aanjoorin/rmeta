FROM cgr.dev/chainguard/python:latest-dev as builder

# Install CA certificates
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy your private key file to a more appropriate location
ADD aanjoorin-arc-app.2024-04-22.private-key.pem /app/aanjoorin-arc-app.2024-04-22.private-key.pem

WORKDIR /app

# Copy other necessary files and install Python dependencies
COPY requirements.txt .

RUN pip install -r requirements.txt --user

# Set appropriate permissions for the private key file
RUN chmod 600 aanjoorin-arc-app.2024-04-22.private-key.pem

# Update CA certificates
RUN update-ca-certificates

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Copy the installed Python packages from the builder stage
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

# Copy the rest of the application code
COPY . .

# Expose port 8000
EXPOSE 8000

# Define the entry point for the container
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

# Label the image
LABEL auth="Ademiju Anjoorin"
