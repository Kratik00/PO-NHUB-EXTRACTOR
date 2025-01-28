FROM python:3.10.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /PO-NHUB-EXTRACTOR
WORKDIR /PO-NHUB-EXTRACTOR
COPY . /PO-NHUB-EXTRACTOR
CMD gunicorn app:app & python3 -m pornhub
