FROM python:3.8-slim

RUN apt update && apt install -y \
  build-essential \
  libdb-dev \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . /app
WORKDIR /app
ENTRYPOINT ["python", "pywallet.py"]
