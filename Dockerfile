FROM python:3.12.3-alpine
#cgr.dev/chainguard/python:latest 
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN groupadd -r demi && useradd -r -g demi demi
WORKDIR /code
COPY . /code/
RUN chown -R demi:demi /code
USER demi
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
#RUN python3 setup.py install
LABEL auth="Ademiju Anjoorin"
#COPY . .
EXPOSE 8000
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
