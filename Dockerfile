FROM ubuntu:18.04

COPY . /
RUN chmod +x gotty

USER sfqaq
RUN chmod 777 /app/gcc
CMD ./gotty -w -p $PORT bash
