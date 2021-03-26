FROM python:slim

RUN pip3 install --upgrade --no-cache \
        prometheus_client \
        smeterd

EXPOSE 8000

COPY  main.py /main.py
ENTRYPOINT ["/usr/local/bin/python3", "-u", "/main.py"]
