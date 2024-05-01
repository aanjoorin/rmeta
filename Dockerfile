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

FROM cgr.dev/chainguard/python:latest 
#python:3.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    # Add any system dependencies required by your Python packages here \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install Python dependencies
COPY requirements.txt .
RUN /bin/sh -c pip3 install -r requirements.txt

# Label the image
LABEL auth="Ademiju Anjoorin"

# Copy the rest of the application code
COPY . .

# Expose port 8000
EXPOSE 8000

# Define the entry point for the container
ENTRYPOINT [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]

