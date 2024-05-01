FROM python:3.10
#cgr.dev/chainguard/python:latest-dev as builder

#COPY aanjoorin-arc-app.2024-04-22.private-key.pem /usr/local/share/ca-certificates/

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt --user

# FROM cgr.dev/chainguard/python:latest

# WORKDIR /app

# # Make sure you update Python version in path
# COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

# Label the image
LABEL auth="Ademiju Anjoorin"

# Copy the rest of the application code
COPY . .

# Expose port 8000
EXPOSE 8000

# Define the entry point for the container
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
