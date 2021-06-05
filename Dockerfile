FROM ubuntu:18.04

COPY . /
RUN chmod +x gotty

USER sfqaq
RUN chmod -R 777 app
CMD ./gotty -w -p $PORT bash
