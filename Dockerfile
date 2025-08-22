FROM public.ecr.aws/docker/library/python:3.11-slim

RUN apt-get update && apt-get install -y \
    nginx curl

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py /app/app.py
COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD service nginx start && gunicorn -b 127.0.0.1:5000 app:app
