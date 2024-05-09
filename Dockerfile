FROM chainguard/python:latest-dev
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /app
COPY requirements.txt .
RUN pip install  --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
ENTRYPOINT [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
LABEL auth="Ademiju Anjoorin"
