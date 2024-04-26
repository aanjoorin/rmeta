FROM cgr.dev/chainguard/python:latest 
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
LABEL auth="Ademiju Anjoorin"
COPY . .
EXPOSE 8000
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
