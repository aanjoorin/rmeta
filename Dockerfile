# FROM cgr.dev/chainguard/python:latest 
# #python:3.12
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1
# WORKDIR /app
# COPY requirements.txt .
# RUN pip3 install --no-cache-dir -r requirements.txt
# LABEL auth="Ademiju Anjoorin"
# COPY . .
# EXPOSE 8000
# ENTRYPOINT [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]

# FROM cgr.dev/chainguard/python:latest-dev
# #python:3.12

# # Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# # Install system dependencies
# RUN /bin/sh -c 'apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*'

# # Set the working directory
# WORKDIR /app

# # Copy requirements.txt and install Python dependencies
# COPY requirements.txt .
# RUN /bin/sh -c 'pip3 install -r requirements.txt'

# # Label the image
# LABEL auth="Ademiju Anjoorin"

# # Copy the rest of the application code
# COPY . .

# # Expose port 8000
# EXPOSE 8000

# # Define the entry point for the container
# ENTRYPOINT [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]

FROM cgr.dev/chainguard/python:latest-dev as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Make sure you update Python version in path
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

# Label the image
LABEL auth="Ademiju Anjoorin"

# Copy the rest of the application code
COPY . .

# Expose port 8000
EXPOSE 8000

# Define the entry point for the container
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

# COPY main.py .

# ENTRYPOINT [ "python", "/app/main.py" ]
