FROM python:3.10-slim
RUN apt-get update

RUN apt-get install python3-dev build-essential -y

ENV PYTHONDONTWRITEBYTECODE 1

ENV VIRTUAL_ENV=/opt/env

RUN pip install --upgrade pip

# /opt/env yerine yukarda tanımlanan  $VIRTUAL_ENV yazdım
RUN pip install virtualenv  && python -m virtualenv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app