FROM cgr.dev/chainguard/python:latest-dev as builder
#ADD aanjoorin-arc-app.2024-04-22.private-key.pem /usr/local/share/ca-certificates/
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt --user
FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages
LABEL auth="Ademiju Anjoorin"
COPY . .
EXPOSE 8000
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
