#FROM apache/beam_python3.8_sdk:2.39.0
FROM python:3.8

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
