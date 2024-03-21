#!/bin/bash

RUN_PORT = ${PORT:-8000}

/usr/loacl/bin/gunicorn --worker-tmp-dir /dev/shm -k uvicorn.workers.UvicornWorker app.main:app --bind "0.0.0.0:${Run_PORT}"