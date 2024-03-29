FROM python:3.11-slim

COPY ./entrypoint.sh /entrypoint.sh
COPY  ./app /app
COPY ./requirements.txt /requirements.txt


RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python3-dev \
    python3-setuptools \
    tesseract-ocr \
    make \
    gcc \
    && python -m pip install -r requirements.txt \
    && app-get remove -y --purge make gcc build-essential \
    && app-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]