FROM python:rc-alpine3.12

WORKDIR app

COPY app.py ./

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

USER 1000

CMD flask run --host=0.0.0.0 --port=5000