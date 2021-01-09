FROM python:rc-alpine3.12

# RUN ls 

COPY . ./

RUN ls

RUN pip3 install -r requirements.txt

CMD ["flask", "run"]