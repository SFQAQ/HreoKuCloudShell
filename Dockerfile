FROM ubuntu:18.04

COPY . /
RUN chmod +x gotty

USER sfqaq
CMD ./gotty -w -p $PORT bash
