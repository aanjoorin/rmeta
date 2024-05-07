FROM cgr.dev/chainguard/python:latest-dev as builder

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /app

COPY requirements.txt .

RUN pip install  --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

# Make sure you update Python version in path
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY . .

EXPOSE 8000

ENTRYPOINT [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]

LABEL auth="Ademiju Anjoorin"
