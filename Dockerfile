FROM cgr.dev/chainguard/python:latest 
#python:3.12
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app
RUN echo "Debug: Listing files in directory" && ls -la
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
LABEL auth="Ademiju Anjoorin"
COPY . .
EXPOSE 8000
ENTRYPOINT [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
