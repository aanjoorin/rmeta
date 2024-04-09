FROM cgr.dev/chainguard/python:latest-dev
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
LABEL auth="Ademiju Anjoorin"
COPY . .
EXPOSE 8000
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]