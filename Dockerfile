FROM cgr.dev/chainguard/python as builder
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
#RUN groupadd -r demi && useradd -r -g demi demi
WORKDIR /code
COPY requirements.txt .
RUN mkdir /install \
    && pip install --prefix=/install -r requirements.txt

FROM cgr.dev/chainguard/python
COPY --from=builder /install /usr/local
WORKDIR /code

# RUN chown -R demi:demi /code
# USER demi
# COPY requirements.txt /code/
# RUN pip install --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt
# #RUN python3 setup.py install
# LABEL auth="Ademiju Anjoorin"
COPY . .
EXPOSE 8000
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
