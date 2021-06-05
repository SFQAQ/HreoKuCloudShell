FROM ubuntu:18.04

COPY . /
RUN chmod +x gotty
RUN chmod +x /app/gcc

USER sfqaq

CMD ./gotty -w -p $PORT bash
