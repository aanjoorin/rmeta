FROM python:3.12.3-alpine
#cgr.dev/chainguard/python:latest 
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /code
COPY . /code/
COPY requirements.txt /code/
#RUN pip install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt --debug
RUN python3 setup.py install
LABEL auth="Ademiju Anjoorin"
#COPY . .
EXPOSE 8000
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
